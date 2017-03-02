#!/usr/bin/env perl

#
# This script converts Fortigate addrgrp to Mikrotik address lists.
#
# Created Mar 1, 2017, author Piotr Najman
# Version 1.0.0
#
# Syntax: addrgrp2alst fortigate_full_config_file rsc_script_filename(addresslists.rsc if not present)
#

use strict;
use warnings;
 
use Data::Dumper qw(Dumper);
use Path::Class;
use autodie;


#
# prototypes

# trim string
sub trim($) {
	my $string = shift;
	$string =~ s/^\s+//;
	$string =~ s/\s+$//;
	return $string;
}

# trim first and last char
sub trimFL($) {
	my $string = shift;
        return substr(substr($string,1),0,-1);
}

# get array with key and data
sub getKeyData($) {
        my $string = shift;
	my @arr;
	my $key = substr($string,0,index($string,' ',0));		
	$string =~ s/$key //;					
	$string =~ s/\"//g;		
	$string =~ s/\'//g;		
	$arr[0] = $key;
	$arr[1] = $string;
	return @arr;
}


#
# main

# set the in/out file nemes
my $numArgs = $#ARGV + 1 < 1 ? die "No FortiGate config file specified.\n" : printf("Script start...\n");
my $fgConfigFile = $ARGV[0];
my $rscScriptFile = "addresslists.rsc";
if ( $numArgs > 1 ) {
    $rscScriptFile = $ARGV[1];
}

# open config file to read data
my $fileIn = file("$fgConfigFile");
my $fileInHandle = $fileIn->openr();

# variables
my %address;
my %addrgrp;

# read in data from FG config file
while( my $line = $fileInHandle->getline() ) {
	#processing addresses 
        if ( $line =~ m/^config firewall address$/ ) {
		while( my $line = $fileInHandle->getline() )  {
			if ( $line =~ m/^end$/ ) {
			    last;
			}
			$line = trim($line);
			if ( $line =~m/edit/ ) {
				my @arr = split(/edit/, $line);
				my $id = substr(substr($arr[1],2),0,-1);			
				while( my $line = $fileInHandle->getline() )  {
					if ( $line =~ m/next/ ) {
					    last;
					}
					$line = trim($line);
					if ( $line =~ m/^set/ ) {
						$line =~ s/set //;
						my @field = getKeyData($line);
						$address{$id}{$field[0]} = $field[1];
					}
				}
			}
		}
	}
	#processing address groups
        if ( $line =~ m/^config firewall addrgrp$/ ) {
		while( my $line = $fileInHandle->getline() )  {
			if ( $line =~ m/^end$/ ) {
			    last;
			}
			$line = trim($line);
			if ( $line =~m/edit/ ) {
				my @arr = split(/edit/, $line);
				my $id = substr(substr($arr[1],2),0,-1);			
				while( my $line = $fileInHandle->getline() )  {
					if ( $line =~ m/next/ ) {
					    last;
					}
					$line = trim($line);
					if ( $line =~ m/^set/ ) {
						$line =~ s/set //;
						my $key = substr($line,0,index($line,' ',0));		
						if ( $key =~ m/member/ ) {
							$line =~ s/$key //;				
						    	$line =~ s/;//g;				
							$line =~ s/\" \"/;/g;				 
							$line =~ s/\"//g;				
						    	$line =~ s/\'//g;		
							my $pos = 0;
							my @members = split(/;/, $line);
							foreach my $member (@members) {
							    $addrgrp{$id}[$pos] = $member;
							    $pos++;
							}
						}
					}
				}
			}
		}
	}
}

# return memberf of addrgrp 
# requrency when member is
# another addrgrp
sub getAddresses {
    my $arr = $_[0];
    my $lines = "";
    foreach my $member (@{$arr}) {
	if ( defined($address{$member}) ) {
		my $data = $address{$member};		
		if ( $data->{type} eq 'ipmask' ) {
		    my $ipmask = $data->{subnet};
		    my $comment = $data->{comment};
		    $ipmask =~ s/ /\//;	    
		    $lines .= "add address=\"$ipmask\" list=\"\" comment=\"$comment\"\n";
		} elsif ( $data->{type} eq 'fqdn' ) {
		    my $fqdn = $data->{fqdn};
		    my $comment = $data->{comment};
		    $lines .= "add address=\"$fqdn\" list=\"\" comment=\"$comment\"\n";
		} else {
		    print "Warrning! Type of field $data->{type}... skipped!\n";
		}
	} else {
	    $lines .= &getAddresses($addrgrp{$member});
	}
    }
    return $lines;
}


# open script file to write data
my $fileOut = file("$rscScriptFile");
$fileOut->touch;
my $fileOutHandle = $fileOut->openw();
$fileOutHandle->print("# by fg2mktik\n#\n/ip firewall address-list\n");
# write data
foreach my $group (keys %addrgrp) {
    my %members = %addrgrp{$group};
    print "$group : ";
    my $lines = &getAddresses($members{$group});
    $lines =~ s/list=\"\"/list=\"$group\"/g;
    $fileOutHandle->print($lines);
}

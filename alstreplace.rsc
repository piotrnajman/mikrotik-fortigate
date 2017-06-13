# this script remove selected addresslists positions, then import new from local file
if ([len [/file find name=fgaddresslists.rsc]] > 0) do={ \
  /ip firewall address-list remove [ find where list="first_address_list"]; \
  /ip firewall address-list remove [ find where list="another address list"]; \
  /import file-name=fgaddresslists.rsc; \
  /file remove fgaddresslists.rsc; \
}


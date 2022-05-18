#!/bin/dash

ssid=$1 ;shift
psk=$1; shift

# Is this network already defined?
network_id=$(wpa_cli list_networks | tail -n +3 | grep $ssid |cut -f 1)

if [ -z  $network_id ] ; then
  maxNetworkId=$(wpa_cli list_networks | tail -n +3 | tail -n 1 | cut -f 1)]
  if [ -z  $maxNetworkId ] ; then
    network_id=0
  else
    network_id=$((maxNetworkID + 1 ))
  fi
else
  wpa_cli remove_network $network_id # Don't care if it fails
fi

cat <<EOF | wpa_cli
add_network $network_id
set_network $network_id ssid "$ssid"
set_network $network_id id_str "$ssid"
set_network $network_id psk "$psk"
enable_network $network_id
save_config
quit
EOF


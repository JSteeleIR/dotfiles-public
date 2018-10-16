#!/bin/bash
# Script to run common tshark operations against a pcap

set -e

PCAP=$1
if [[ -z $PCAP ]]; then
  echo "Usage: $0 <file.pcap>"
  return 1
fi

if [[ ! -a $PCAP ]]; then
  echo "$PCAP does not exist."
fi


echo "Capture information:"
echo "$> capinfos -csdluaezx $PCAP"
capinfos -csdluaezx $PCAP

echo -e "\n================================================================================\n"
echo "Running tshark summaries on $PCAP..."

echo -e "\n$> tshark -r $PCAP -q -z conv,ip"
tshark -r $PCAP -q -z conv,ip


echo -e "\n$> tshark -r $PCAP -q -z conv,tcp"
tshark -r $PCAP -q -z conv,tcp

echo -e "\nTCP streams:"
echo "$> tshark -r $PCAP -T fields -e tcp.stream | sort -un"
tshark -r $PCAP -T fields -e tcp.stream | sort -u



echo -e "\n$> tshark -r $PCAP -q -z conv,udp"
tshark -r $PCAP -q -z conv,udp

echo -e "\n================================================================================\n"
echo "Attempting to extract POST data from available HTTP streams:"

tshark -r $PCAP -Y 'http.request.method == "POST"' -T json -e http.host -e http.user_agent -e http.referer -e http.request.full_uri -e http.file_data  | jq '.[]._source.layers'

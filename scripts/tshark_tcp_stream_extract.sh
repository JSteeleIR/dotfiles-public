#!/bin/bash
# Quick script to extract a specified tcp stream (or all) from a pcap

set -e

PCAP=$1
if [[ -z $PCAP ]]; then
  echo "Usage: $0 <file.pcap> [<stream#>]"
  return 1
fi

if [[ ! -a $PCAP ]]; then
  echo "$PCAP does not exist."
fi

echo "Determining total number of streams..."
STREAM_COUNT=`tshark -r $PCAP -T fields -e tcp.stream | sort -u | wc -l`
echo "$STREAM_COUNT streams detected."

if [[ -n $2 && ($2 -ge $(( $STREAM_COUNT - 1 ))) ]]; then
  STREAM=$2
elif [[ -n "$2" ]]; then
  echo "Stream # \"$2\" doesn't exist!"
  return 1
fi

echo "Extracting streams..."
if [[ -n "$STREAM" ]]; then
  tshark -r $PCAP -q -z follow,tcp,ascii,$STREAM
else
  for STREAM in `seq 0 $(( $STREAM_COUNT -1 ))`; do
    tshark -r $PCAP -q -z follow,tcp,ascii,$STREAM
  done
fi

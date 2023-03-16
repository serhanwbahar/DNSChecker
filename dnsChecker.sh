#!/bin/bash

domain_name=$1
record_type_arg=${2^^}

# Function to check DNS records
check_dns_records() {
  local record_type=$1
  local dns_servers=("1.1.1.1" "208.67.222.222" "8.8.8.8" "8.26.56.26" "9.9.9.9")
  
  echo "${record_type} RECORDS"
  
  for dns_server in "${dns_servers[@]}"; do
    records=$(dig +nocmd $domain_name @$dns_server $record_type +noall +answer | awk '{print substr($0, index($0,$4))}')
    
    if [ "$records" != "out; no servers could be reached" ]; then
      echo $records | sed "s/${record_type}/\n&/g" | sed '/^$/d'
      return 0
    fi
  done

  echo "Error!"
  exit 110
}

record_types=("A" "AAAA" "ANY" "CAA" "CNAME" "MX" "NS" "SOA" "TXT")

if [ -z "$record_type_arg" ]; then
  for record_type in "${record_types[@]}"; do
    check_dns_records "$record_type" $domain_name
    echo
  done
else
  if [[ " ${record_types[*]} " == *" ${record_type_arg} "* ]]; then
    check_dns_records "$record_type_arg" $domain_name
  else
    echo "Invalid record type!"
    exit 111
  fi
fi

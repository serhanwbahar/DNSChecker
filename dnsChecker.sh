#!/bin/bash

if [ -z "$1" ]; then
    echo "Error: Missing domain name!"
    echo "Usage: $0 <domain_name> [subdomain] [record_type]"
    exit 101
fi

domain_name=$1
subdomain=${2:-""}
record_type=${3:-"ANY"}

if [ ! -z "$subdomain" ]; then
    domain_name="${subdomain}.${domain_name}"
fi

supported_record_types=("A" "AAAA" "CNAME" "MX" "NS" "SOA" "TXT" "ANY")

if [[ ! " ${supported_record_types[@]} " =~ " ${record_type} " ]]; then
    echo "Error: Invalid record type!"
    echo "Supported record types: ${supported_record_types[*]}"
    exit 102
fi

dns_servers=(
    "1.1.1.1"       # Cloudflare
    "208.67.222.222" # OpenDNS
    "8.8.8.8"        # Google DNS
    "8.26.56.26"     # Comodo Secure DNS
    "9.9.9.9"        # Quad9
)

function check_records() {
    local domain=$1
    local server=$2
    local rtype=${3:-"ANY"}

    if [ "$rtype" == "ANY" ]; then
        for rt in "${supported_record_types[@]}"; do
            if [ "$rt" != "ANY" ]; then
                check_records "$domain" "$server" "$rt"
            fi
        done
    else
        records=$(dig +nocmd "$domain" @"$server" "$rtype" +noall +answer | awk '{print substr($0, index($0,$4))}')
        if [ "$records" != "out; no servers could be reached" ]; then
            if [ -n "$records" ]; then
                echo "$records" | sed "s/$rtype/\n&/g" | sed '/^$/d'
            else
                echo "No $rtype records found."
            fi
        else
            echo "Error: Unable to reach DNS server $server!"
            exit 103
        fi
    fi
}

for dns_server in "${dns_servers[@]}"; do
    echo "Checking $record_type records using DNS server $dns_server:"
    check_records "$domain_name" "$dns_server" "$record_type"
    echo
done

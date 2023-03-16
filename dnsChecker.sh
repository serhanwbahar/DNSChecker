#!/bin/bash

domain_name=$1
subdomain=$2
record_type=$3

if [ ! -z "$subdomain" ]; then
    domain_name="${subdomain}.${domain_name}"
fi

if [ -z "$record_type" ]; then
    record_type="ANY"
fi

dns_servers=(
    "1.1.1.1"         # Cloudflare
    "208.67.222.222"  # OpenDNS
    "8.8.8.8"         # Google DNS
    "8.26.56.26"      # Comodo Secure DNS
    "9.9.9.9"         # Quad9
)

function query_record() {
    local domain=$1
    local dns_server=$2
    local record=$3

    echo "$(dig +nocmd "${domain}" @${dns_server} ${record} +noall +answer | awk '{print substr($0, index($0,$4))}')"
}

function check_record() {
    local domain=$1
    local record=$2

    for dns_server in "${dns_servers[@]}"; do
        result=$(query_record "${domain}" "${dns_server}" "${record}")

        if [ "${result}" != "out; no servers could be reached" ]; then
            echo "${result}" | sed "s/${record}/\n&/g" | sed '/^$/d'
            return
        fi
    done

    echo "Error!"
    exit 110
}

echo "${record_type^^} RECORDS"
check_record "${domain_name}" "${record_type}"

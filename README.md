# DNS Record Checker Script

This bash script checks DNS records for a given domain and its subdomains (optional). It supports checking A, AAAA, CNAME, MX, NS, SOA, TXT, and ANY records. The script queries multiple DNS servers to ensure accurate results.

# Requirements

* Bash (4.x or higher)
* `dig` (part of the dnsutils package)

# Installation

1. Download the script or clone the repository.
2. Make the script executable: `chmod +x dnsChecker.sh`

# Usage

```
./dnsChecker.sh <domain_name> [subdomain] [record_type]
```

* `<domain_name>`: The domain name for which you want to check the DNS records (e.g., example.com).
* `[subdomain]` (optional): The subdomain to check, if required (e.g., www).
* `[record_type]` (optional): The type of DNS record you want to check. Supported record types are A, AAAA, CNAME, MX, NS, SOA, TXT, and ANY. The default is ANY, which checks all supported record types.

# Examples

1. Check all supported DNS records for example.com:

```
./dnsChecker.sh example.com
```

2. Check A records for example.com:

```
./dnsChecker.sh example.com "" A
```

3. Check all supported DNS records for the www subdomain of example.com:

```
./dnsChecker.sh example.com www
```

4. heck MX records for the mail subdomain of example.com:

```
./dnsChecker.sh example.com mail MX
```

# Error Codes

`101`: Missing domain name
`102`: Invalid record type
`103`: Unable to reach DNS server

These error codes are displayed alongside descriptive error messages to guide the user when encountering issues.

# License

This project is licensed under the [MIT License](https://opensource.org/license/mit/).

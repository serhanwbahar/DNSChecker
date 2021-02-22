#!/bin/bash

domain_name=$1

#checking a records
echo A RECORDS 
#cloudflare-dns
a_records=$(dig +nocmd $domain_name @1.1.1.1 a +noall +answer | awk '{print substr($0, index($0,$4))}')

    if [ "$a_records" != "out; no servers could be reached" ];
    then
        echo $a_records | sed 's/A/\n&/g' | sed '/^$/d'
    else
        #opendns
        a_records_2=$(dig +nocmd $domain_name @208.67.222.222 a +noall +answer | awk '{print substr($0, index($0,$4))}')
        if [ "$a_records_2" != "out; no servers could be reached" ];
        then  
            echo $a_records_2 | sed 's/A/\n&/g' | sed '/^$/d'
        else
           #google-dns
            a_records_3=$(dig +nocmd $domain_name @8.8.8.8 a +noall +answer | awk '{print substr($0, index($0,$4))}')
            if [ "$a_records_3" != "out; no servers could be reached" ];
            then  
                echo $a_records_3 | sed 's/A/\n&/g' | sed '/^$/d'
            else
                #comodo-secure-dns
                a_records_4=$(dig +nocmd $domain_name @8.26.56.26 a +noall +answer | awk '{print substr($0, index($0,$4))}')
                if [ "$a_records_4" != "out; no servers could be reached" ];
                then  
                    echo $a_records_4 | sed 's/A/\n&/g' | sed '/^$/d'
                else
                    #Quad9-dns
                    a_records_5=$(dig +nocmd $domain_name @9.9.9.9 a +noall +answer | awk '{print substr($0, index($0,$4))}')
                    if [ "$a_records_5" != "out; no servers could be reached" ];
                    then  
                        echo $a_records_5 | sed 's/A/\n&/g' | sed '/^$/d'
                    else
                        echo "Error!"
                        exit 110
                    fi
                fi
            fi
        fi
    fi

echo

#checking aaaa records
echo AAAA RECORDS 
#cloudflare-dns
aaaa_records=$(dig +nocmd $domain_name @1.1.1.1 aaaa +noall +answer | awk '{print substr($0, index($0,$4))}')

    if [ "$aaaa_records" != "out; no servers could be reached" ];
    then
        echo $aaaa_records | sed 's/AAAA/\n&/g' | sed '/^$/d'
    else
        #opendns
        aaaa_records_2=$(dig +nocmd $domain_name @208.67.222.222 aaaa +noall +answer | awk '{print substr($0, index($0,$4))}')
        if [ "$aaaa_records_2" != "out; no servers could be reached" ];
        then  
            echo $aaaa_records_2 | sed 's/AAAA/\n&/g' | sed '/^$/d'
        else
           #google-dns
            aaaa_records_3=$(dig +nocmd $domain_name @8.8.8.8 aaaa +noall +answer | awk '{print substr($0, index($0,$4))}')
            if [ "$aaaa_records_3" != "out; no servers could be reached" ];
            then  
                echo $aaaa_records_3 | sed 's/AAAA/\n&/g' | sed '/^$/d'
            else
                #comodo-secure-dns
                aaaa_records_4=$(dig +nocmd $domain_name @8.26.56.26 aaaa +noall +answer | awk '{print substr($0, index($0,$4))}')
                if [ "$aaaa_records_4" != "out; no servers could be reached" ];
                then  
                    echo $aaaa_records_4 | sed 's/AAAA/\n&/g' | sed '/^$/d'
                else
                    #Quad9-dns
                    aaaa_records_5=$(dig +nocmd $domain_name @9.9.9.9 aaaa +noall +answer | awk '{print substr($0, index($0,$4))}')
                    if [ "$aaaa_records_5" != "out; no servers could be reached" ];
                    then  
                        echo $aaaa_records_5 | sed 's/AAAA/\n&/g' | sed '/^$/d'
                    else
                        echo "Error!"
                        exit 110
                    fi
                fi
            fi
        fi
    fi

echo

#checking any records
echo ANY RECORDS 
#cloudflare-dns
any_records=$(dig +nocmd $domain_name @1.1.1.1 any +noall +answer | awk '{print substr($0, index($0,$4))}')

    if [ "$any_records" != "out; no servers could be reached" ];
    then
        echo $any_records | sed 's/ANY/\n&/g' | sed '/^$/d'
    else
        #opendns
        any_records_2=$(dig +nocmd $domain_name @208.67.222.222 any +noall +answer | awk '{print substr($0, index($0,$4))}')
        if [ "$any_records_2" != "out; no servers could be reached" ];
        then  
            echo $any_records_2 | sed 's/ANY/\n&/g' | sed '/^$/d'
        else
           #google-dns
            any_records_3=$(dig +nocmd $domain_name @8.8.8.8 any +noall +answer | awk '{print substr($0, index($0,$4))}')
            if [ "$any_records_3" != "out; no servers could be reached" ];
            then  
                echo $any_records_3 | sed 's/ANY/\n&/g' | sed '/^$/d'
            else
                #comodo-secure-dns
                any_records_4=$(dig +nocmd $domain_name @8.26.56.26 any +noall +answer | awk '{print substr($0, index($0,$4))}')
                if [ "$any_records_4" != "out; no servers could be reached" ];
                then  
                    echo $any_records_4 | sed 's/ANY/\n&/g' | sed '/^$/d'
                else
                    #Quad9-dns
                    any_records_5=$(dig +nocmd $domain_name @9.9.9.9 any +noall +answer | awk '{print substr($0, index($0,$4))}')
                    if [ "$any_records_5" != "out; no servers could be reached" ];
                    then  
                        echo $any_records_5 | sed 's/ANY/\n&/g' | sed '/^$/d'
                    else
                        echo "Error!"
                        exit 110
                    fi
                fi
            fi
        fi
    fi

echo

#checking caa records
echo CAA RECORDS 
#cloudflare-dns
caa_records=$(dig +nocmd $domain_name @1.1.1.1 caa +noall +answer | awk '{print substr($0, index($0,$4))}')

    if [ "$caa_records" != "out; no servers could be reached" ];
    then
        echo $caa_records | sed 's/CAA/\n&/g' | sed '/^$/d'
    else
        #opendns
        caa_records_2=$(dig +nocmd $domain_name @208.67.222.222 caa +noall +answer | awk '{print substr($0, index($0,$4))}')
        if [ "$caa_records_2" != "out; no servers could be reached" ];
        then  
            echo $caa_records_2 | sed 's/CAA/\n&/g' | sed '/^$/d'
        else
           #google-dns
            caa_records_3=$(dig +nocmd $domain_name @8.8.8.8 caa +noall +answer | awk '{print substr($0, index($0,$4))}')
            if [ "$caa_records_3" != "out; no servers could be reached" ];
            then  
                echo $caa_records_3 | sed 's/CAA/\n&/g' | sed '/^$/d'
            else
                #comodo-secure-dns
                caa_records_4=$(dig +nocmd $domain_name @8.26.56.26 caa +noall +answer | awk '{print substr($0, index($0,$4))}')
                if [ "$caa_records_4" != "out; no servers could be reached" ];
                then  
                    echo $caa_records_4 | sed 's/CAA/\n&/g' | sed '/^$/d'
                else
                    #Quad9-dns
                    caa_records_5=$(dig +nocmd $domain_name @9.9.9.9 caa +noall +answer | awk '{print substr($0, index($0,$4))}')
                    if [ "$caa_records_5" != "out; no servers could be reached" ];
                    then  
                        echo $caa_records_5 | sed 's/CAA/\n&/g' | sed '/^$/d'
                    else
                        echo "Error!"
                        exit 110
                    fi
                fi
            fi
        fi
    fi

echo

#checking cname records
echo CNAME RECORDS 
#cloudflare-dns
cname_records=$(dig +nocmd $domain_name @1.1.1.1 cname +noall +answer | awk '{print substr($0, index($0,$4))}')

    if [ "$cname_records" != "out; no servers could be reached" ];
    then
        echo $cname_records | sed 's/CNAME/\n&/g' | sed '/^$/d'
    else
        #opendns
        cname_records_2=$(dig +nocmd $domain_name @208.67.222.222 cname +noall +answer | awk '{print substr($0, index($0,$4))}')
        if [ "$cname_records_2" != "out; no servers could be reached" ];
        then  
            echo $cname_records_2 | sed 's/CNAME/\n&/g' | sed '/^$/d'
        else
           #google-dns
            cname_records_3=$(dig +nocmd $domain_name @8.8.8.8 cname +noall +answer | awk '{print substr($0, index($0,$4))}')
            if [ "$cname_records_3" != "out; no servers could be reached" ];
            then  
                echo $cname_records_3 | sed 's/CNAME/\n&/g' | sed '/^$/d'
            else
                #comodo-secure-dns
                cname_records_4=$(dig +nocmd $domain_name @8.26.56.26 cname +noall +answer | awk '{print substr($0, index($0,$4))}')
                if [ "$cname_records_4" != "out; no servers could be reached" ];
                then  
                    echo $cname_records_4 | sed 's/CNAME/\n&/g' | sed '/^$/d'
                else
                    #Quad9-dns
                    cname_records_5=$(dig +nocmd $domain_name @9.9.9.9 cname +noall +answer | awk '{print substr($0, index($0,$4))}')
                    if [ "$cname_records_5" != "out; no servers could be reached" ];
                    then  
                        echo $cname_records_5 | sed 's/CNAME/\n&/g' | sed '/^$/d'
                    else
                        echo "Error!"
                        exit 110
                    fi
                fi
            fi
        fi
    fi

echo

#checking mx records
echo MX RECORDS 
#cloudflare-dns
mx_records=$(dig +nocmd $domain_name @1.1.1.1 mx +noall +answer | awk '{print substr($0, index($0,$4))}')

    if [ "$mx_records" != "out; no servers could be reached" ];
    then
        echo $mx_records | sed 's/MX/\n&/g' | sed '/^$/d'
    else
        #opendns
        mx_records_2=$(dig +nocmd $domain_name @208.67.222.222 mx +noall +answer | awk '{print substr($0, index($0,$4))}')
        if [ "$mx_records_2" != "out; no servers could be reached" ];
        then  
            echo $mx_records_2 | sed 's/MX/\n&/g' | sed '/^$/d'
        else
           #google-dns
            mx_records_3=$(dig +nocmd $domain_name @8.8.8.8 mx +noall +answer | awk '{print substr($0, index($0,$4))}')
            if [ "$mx_records_3" != "out; no servers could be reached" ];
            then  
                echo $mx_records_3 | sed 's/MX/\n&/g' | sed '/^$/d'
            else
                #comodo-secure-dns
                mx_records_4=$(dig +nocmd $domain_name @8.26.56.26 mx +noall +answer | awk '{print substr($0, index($0,$4))}')
                if [ "$mx_records_4" != "out; no servers could be reached" ];
                then  
                    echo $mx_records_4 | sed 's/MX/\n&/g' | sed '/^$/d'
                else
                    #Quad9-dns
                    mx_records_5=$(dig +nocmd $domain_name @9.9.9.9 mx +noall +answer | awk '{print substr($0, index($0,$4))}')
                    if [ "$mx_records_5" != "out; no servers could be reached" ];
                    then  
                        echo $mx_records_5 | sed 's/MX/\n&/g' | sed '/^$/d'
                    else
                        echo "Error!"
                        exit 110
                    fi
                fi
            fi
        fi
    fi

echo

#checking ns records
echo NS RECORDS 
#cloudflare-dns
ns_records=$(dig +nocmd $domain_name @1.1.1.1 ns +noall +answer | awk '{print substr($0, index($0,$4))}')

    if [ "$ns_records" != "out; no servers could be reached" ];
    then
        echo $ns_records | sed 's/NS/\n&/g' | sed '/^$/d'
    else
        #opendns
        ns_records_2=$(dig +nocmd $domain_name @208.67.222.222 ns +noall +answer | awk '{print substr($0, index($0,$4))}')
        if [ "$ns_records_2" != "out; no servers could be reached" ];
        then  
            echo $ns_records_2 | sed 's/NS/\n&/g' | sed '/^$/d'
        else
           #google-dns
            ns_records_3=$(dig +nocmd $domain_name @8.8.8.8 ns +noall +answer | awk '{print substr($0, index($0,$4))}')
            if [ "$ns_records_3" != "out; no servers could be reached" ];
            then  
                echo $ns_records_3 | sed 's/NS/\n&/g' | sed '/^$/d'
            else
                #comodo-secure-dns
                ns_records_4=$(dig +nocmd $domain_name @8.26.56.26 ns +noall +answer | awk '{print substr($0, index($0,$4))}')
                if [ "$ns_records_4" != "out; no servers could be reached" ];
                then  
                    echo $ns_records_4 | sed 's/NS/\n&/g' | sed '/^$/d'
                else
                    #Quad9-dns
                    ns_records_5=$(dig +nocmd $domain_name @9.9.9.9 ns +noall +answer | awk '{print substr($0, index($0,$4))}')
                    if [ "$ns_records_5" != "out; no servers could be reached" ];
                    then  
                        echo $ns_records_5 | sed 's/NS/\n&/g' | sed '/^$/d'
                    else
                        echo "Error!"
                        exit 110
                    fi
                fi
            fi
        fi
    fi

echo

#checking soa records
echo SOA RECORDS 
#cloudflare-dns
soa_records=$(dig +nocmd $domain_name @1.1.1.1 soa +noall +answer | awk '{print substr($0, index($0,$4))}')

    if [ "$soa_records" != "out; no servers could be reached" ];
    then
        echo $soa_records | sed 's/SOA/\n&/g' | sed '/^$/d'
    else
        #opendns
        soa_records_2=$(dig +nocmd $domain_name @208.67.222.222 soa +noall +answer | awk '{print substr($0, index($0,$4))}')
        if [ "$soa_records_2" != "out; no servers could be reached" ];
        then  
            echo $soa_records_2 | sed 's/SOA/\n&/g' | sed '/^$/d'
        else
           #google-dns
            soa_records_3=$(dig +nocmd $domain_name @8.8.8.8 soa +noall +answer | awk '{print substr($0, index($0,$4))}')
            if [ "$soa_records_3" != "out; no servers could be reached" ];
            then  
                echo $soa_records_3 | sed 's/SOA/\n&/g' | sed '/^$/d'
            else
                #comodo-secure-dns
                soa_records_4=$(dig +nocmd $domain_name @8.26.56.26 soa +noall +answer | awk '{print substr($0, index($0,$4))}')
                if [ "$soa_records_4" != "out; no servers could be reached" ];
                then  
                    echo $soa_records_4 | sed 's/SOA/\n&/g' | sed '/^$/d'
                else
                    #Quad9-dns
                    soa_records_5=$(dig +nocmd $domain_name @9.9.9.9 soa +noall +answer | awk '{print substr($0, index($0,$4))}')
                    if [ "$soa_records_5" != "out; no servers could be reached" ];
                    then  
                        echo $soa_records_5 | sed 's/SOA/\n&/g' | sed '/^$/d'
                    else
                        echo "Error!"
                        exit 110
                    fi
                fi
            fi
        fi
    fi

echo

#checking txt records
echo TXT RECORDS 
#cloudflare-dns
txt_records=$(dig +nocmd $domain_name @1.1.1.1 txt +noall +answer | awk '{print substr($0, index($0,$4))}')

    if [ "$txt_records" != "out; no servers could be reached" ];
    then
        echo $txt_records | sed 's/TXT/\n&/g' | sed '/^$/d'
    else
        #opendns
        txt_records_2=$(dig +nocmd $domain_name @208.67.222.222 txt +noall +answer | awk '{print substr($0, index($0,$4))}')
        if [ "$txt_records_2" != "out; no servers could be reached" ];
        then  
            echo $txt_records_2 | sed 's/TXT/\n&/g' | sed '/^$/d'
        else
           #google-dns
            txt_records_3=$(dig +nocmd $domain_name @8.8.8.8 txt +noall +answer | awk '{print substr($0, index($0,$4))}')
            if [ "$txt_records_3" != "out; no servers could be reached" ];
            then  
                echo $txt_records_3 | sed 's/TXT/\n&/g' | sed '/^$/d'
            else
                #comodo-secure-dns
                txt_records_4=$(dig +nocmd $domain_name @8.26.56.26 txt +noall +answer | awk '{print substr($0, index($0,$4))}')
                if [ "$txt_records_4" != "out; no servers could be reached" ];
                then  
                    echo $txt_records_4 | sed 's/TXT/\n&/g' | sed '/^$/d'
                else
                    #Quad9-dns
                    txt_records_5=$(dig +nocmd $domain_name @9.9.9.9 txt +noall +answer | awk '{print substr($0, index($0,$4))}')
                    if [ "$txt_records_5" != "out; no servers could be reached" ];
                    then  
                        echo $txt_records_5 | sed 's/TXT/\n&/g' | sed '/^$/d'
                    else
                        echo "Error!"
                        exit 110
                    fi
                fi
            fi
        fi
    fi

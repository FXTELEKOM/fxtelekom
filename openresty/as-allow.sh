#!/bin/bash

read -p "Enter AS number: " ASNUM

USER_AGENT="fxtelekom"

# V4
whois -h whois.radb.net -r $USER_AGENT "-i origin $ASNUM" | grep -Eo "([0-9.]+){4}/[0-9]+" | sort -u | sed 's/^/allow /;s/$/;/' > "$ASNUM.conf"
# V6
whois -h whois.radb.net -r $USER_AGENT "-i origin $ASNUM" | grep -Eo "([0-9a-fA-F:]+){8}[\/][0-9]+" | sort -u | sed 's/^/allow /;s/$/;/' >> "$ASNUM.conf"

wait

echo "IP ranges allowed and saved to $ASNUM.conf"

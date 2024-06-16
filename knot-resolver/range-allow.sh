read -p "AS number: " ASNUM

USER_AGENT="fxtelekom"

#V4
whois -h whois.radb.net -r $USER_AGENT "-i origin $ASNUM" | grep -Eo "([0-9.]+){4}/[0-9]+" | sort -u > telekom.list
#V6
whois -h whois.radb.net -r $USER_AGENT "-i origin $ASNUM" | grep -Eo "([0-9a-fA-F:]+){8}[\/][0-9]+" | sort -u >> telekom.list

wait

echo "IP ranges allowed and saved to telekom.list"

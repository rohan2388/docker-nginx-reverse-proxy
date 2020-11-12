#!/bin/sh

i=1
while [ $i -le 100 ]
do	
	name="SITE_$i"
	vhost=$(eval echo "\$$name")
	if [[ ! -z "$vhost" ]]; then		
		site="${vhost}"	
		domain=$(echo $site | cut -f 1 -d "=")
		url=$(echo $site | cut -f 2 -d "=")	
		file="${domain}.conf"
		echo "Creating proxy for: $domain [$name]"
		cp /etc/nginx/proxy-template.conf /etc/nginx/proxies/$file 
		sed -i "s,REPLACE_DOMAIN,${domain},g" /etc/nginx/proxies/$file 
		sed -i "s,REPLACE_URL,$url,g" /etc/nginx/proxies/$file 		
		echo "...Done!"		
	fi
    i=$(($i+1))
done



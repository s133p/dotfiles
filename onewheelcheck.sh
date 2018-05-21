#!/bin/bash
lastmod=$(date -r onewheel.txt +%s)
now=$(date +%s)
diff=$(expr $now - $lastmod)

if [[ $diff -gt 1200 ]];then
    data='order_number=#####&email=****************@gmail.com'
    url='https://tracker.onewheel.com/include/production_query.php'
    curl -s $url -H 'Origin: https://onewheel.com' -H 'Accept-Encoding: gzip, deflate, br' -H 'Accept-Language: en-US,en;q=0.9' -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' -H 'Accept: */*' -H 'Referer: # https://onewheel.com/pages/dude-wheres-my-onewheel' -H 'Connection: keep-alive' --data $data --compressed | tr ',' '\n' > onewheel.txt
fi


echo
echo 'Onewheel Order Status'
echo '==================================='
cat onewheel.txt | grep  'order_status' |  sed -e 's/".*":/:/' -e 's/:/Order Status: /' -e 's/"//g'
cat onewheel.txt | grep  'ship_date' | sed -e 's/".*":/:/' -e 's/:/Est Ship Date: /' -e 's/"//g' -e 's/[0-9][0-9]:[0-9][0-9]:[0-9][0-9] .[0-9][0-9][0-9][0-9]//'


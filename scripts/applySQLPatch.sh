#!/bin/bash
USER=$1
PASS=$2
DB=$3

mysql -u${USER} -p${PASS} << END 
    UPDATE drupal.watchdog SET `referer`=replace(`referer`, \"drupal.demo.jelastic.com\", \"${env.domain}\"); UPDATE drupal.watchdog SET `location`=replace(`location`, \"drupal.demo.jelastic.com\", \"${env.domain}\"); UPDATE drupal.users_field_data SET mail=\"${user.email}\" WHERE uid=1; UPDATE drupal.users_field_data SET init=\"${user.email}\" WHERE uid=1;
END

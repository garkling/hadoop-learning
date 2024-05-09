#!/bin/bash

CONFIG_FILE="/etc/zeppelin/conf/interpreter.json"
ROLE=$(/usr/share/google/get_metadata_value attributes/dataproc-role)

if [[ "${ROLE}" == 'Master' ]]; then
  jq '.interpreterSettings.jdbc.properties += {
      "hive.driver": {
        "name": "hive.driver",
        "value": "org.apache.hive.jdbc.HiveDriver",
        "type": "string"
      },
      "hive.url": {
        "name": "hive.url",
        "value": "jdbc:hive2://localhost:10000",
        "type": "string"
      },
      "hive.splitQueries": {
        "name": "hive.splitQueries",
        "value": true,
        "type": "checkbox"
      }
  }' $CONFIG_FILE > temp.json && mv temp.json $CONFIG_FILE

  systemctl restart zeppelin

fi
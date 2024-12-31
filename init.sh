#!/bin/bash

#create a directory -p ./mosquitto/config
mkdir -p ./mosquitto/config

# Print a message to indicate success
echo "Directory './mosquitto/config' created successfully."

#enter and write the file
cat << EOL > ./mosquitto/config/mosquitto.conf
listener 1883
allow_anonymous true
EOL

#create a directory -p /etc/mosquitto/conf.d
sudo mkdir -p /etc/mosquitto/conf.d

cat << EOL > /etc/mosquitto/conf.d/default.conf
listener 1883
allow_anonymous true

listener 8883
certfile /etc/letsencrypt/live/mqtt.muqtadir.site/cert.pem
cafile /etc/letsencrypt/live/mqtt.muqtadir.site/chain.pem
keyfile /etc/letsencrypt/live/mqtt.muqtadir.site/privkey.pem
EOL

sudo docker-compose up -d
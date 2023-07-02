#!/bin/bash

LOCATION=$(pwd)
STACK=$'Stack-Traefik-Proxy'


if [ -n $1 ]
then
  echo ' Up. Services'
  echo ' Usage: services <option>'
  echo ' Options: up, stop, restart'
fi


#Stack Create
if [[ $1 == 'up' ]]
then
  echo 'Add email, cloudflare api key and domain to be used in traefik'
   read
      vim $STACK/.env
  sleep 5

  echo 'Create stack proxy, traefik and portainer...'
  sleep 5
  cd $STACK
    docker compose up -d
  
fi

#Restart Stack
if [[ $1 == 'restart' ]]
then
  echo 'Restarting stack proxy, traefik and portainer...'
  sleep 5
  cd $STACK
    docker compose down
    docker compose up -d
 
fi

#Stop Stack
if [[ $1 == 'stop' ]]
then
  echo 'Stopping stack proxy, traefik and portainer...'
  sleep 5
  cd $STACK
     docker compose stop -t 30

fi

#Start Stack
if [[ $1 == 'start' ]]
then
  echo 'Starting stack proxy, traefik and portainer...'
  sleep 5
  cd $STACK
     docker compose start
fi

cd $LOCATION


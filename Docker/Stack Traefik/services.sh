#!/bin/bash

LOCATION=$(pwd)
PROXY=$'proxy'
TRAEFIK=$'traefik'
PORTAINER=$'portainer'

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
      vim $TRAEFIK/.env
  sleep 5

  echo 'Create stack proxy, traefik and portainer...'
  sleep 5
  cd $PROXY
    docker compose up -d
  cd $TRAEFIK
    docker compose up -d
  cd $PORTAINER
    docker compose up -d
fi

#Restart Stack
if [[ $1 == 'restart' ]]
then
  echo 'Restarting stack proxy, traefik and portainer...'
  sleep 5
  cd $PROXY
    docker compose down
    docker compose up -d
  cd $TRAEFIK
    docker compose down
    docker compose up -d
  cd $PORTAINER
    docker compose down
    docker compose up -d
fi

#Stop Stack
if [[ $1 == 'stop' ]]
then
  echo 'Stopping stack proxy, traefik and portainer...'
  sleep 5
  cd $PROXY
     docker compose stop -t 30
  cd $TRAEFIK
    docker compose stop -t 30

  cd $PORTAINER
     docker compose stop -t 30
fi

#Start Stack
if [[ $1 == 'start' ]]
then
  echo 'Starting stack proxy, traefik and portainer...'
  sleep 5
  cd $PROXY
     docker compose start
  cd $TRAEFIK
    docker compose start

  cd $PORTAINER
     docker compose start
fi

cd $LOCATION


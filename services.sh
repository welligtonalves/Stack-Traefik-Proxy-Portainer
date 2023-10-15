#!/bin/bash
#!/bin/bash
####################################################################
# Script de backup criado por Welligton Alves Analista eulabs  #####
####################################################################

LOCATION=$(pwd)


if [ -n $1 ]
then
  echo ' Up. Services'
  echo ' Usage: services <option>'
  echo ' Options: up, stop, restart, exclud'
fi


#Stack Create
if [[ $1 == 'up' ]]
then
  echo 'Add email, cloudflare api key and domain to be used in traefik <press enter to continue..>'
   read
   sleep 2

      vim .env

  echo 'Verfy network proxy already exist'
  sleep 5 

      docker network ls |grep -iw proxy

  if [ $? -eq 0 ]; then

  sleep 5
  echo 'Network proxy already exist'
  sleep 5

  echo 'Create stack proxy, traefik and portainer...'
  sleep 5

       docker compose up -d
  
  sleep 4 
  
  echo
  echo
  echo "To access the traefik dashboard"
  echo
  echo
  cat .env |cut -c17- | head -n 3 |tail -n 1
  echo
  echo
  echo "To access the portainer" 
  echo
  echo
  cat .env |cut -c19- | head -n 4 |tail -n 1
  echo
  echo

else
  echo 'Network proxy not exist'
  echo 'Create network proxy'
  sleep 5

        docker network create proxy

fi

  sleep 5

  echo 'Create stack proxy, traefik and portainer...'
  sleep 5
    docker compose up -d

  sleep 4
  
  echo
  echo
  echo "To access the traefik dashboard"
  echo
  echo
  cat .env |cut -c17- | head -n 3 |tail -n 1
  echo
  echo
  echo "To access the portainer" 
  echo
  echo
  cat .env |cut -c19- | head -n 4 |tail -n 1
  echo
  echo

fi

#Restart Stack
if [[ $1 == 'restart' ]]
then
  echo 'Restarting stack proxy, traefik and portainer...'
  sleep 5
    docker compose down
  sleep 4 
    docker compose up -d
 
fi

#Stop Stack
if [[ $1 == 'stop' ]]
then
  echo 'Stopping stack proxy, traefik and portainer...'
  sleep 5
     docker compose stop -t 30

fi

#Start Stack
if [[ $1 == 'start' ]]
then
  echo 'Starting stack proxy, traefik and portainer...'
  sleep 5
     docker compose start
fi


#Exclud Stack
if [[ $1 == 'exclud' ]]
then
  echo 'exclud stack proxy, traefik and portainer...'
  sleep 5
     docker compose down -v
     docker network rm proxy
fi

cd $LOCATION

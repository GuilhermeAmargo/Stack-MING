#!/bin/bash

# Intervalo de temperatura
min_temp=20
max_temp=50

while true; do
  # Gera temperatura aleatória entre min_temp e max_temp
  temp=$(( RANDOM % (max_temp - min_temp + 1) + min_temp ))
  
  echo "Enviando temperatura: $temp"
  
  docker exec iotmingstack-mosquitto-1 \
    mosquitto_pub -h mosquitto -p 1883 -t "esp32/temperature" -m "$temp" -q 1

  sleep 15
done

#! /bin/bash

docker stop flask-middleware && docker rm flask-middleware
docker stop logstash && docker rm logstash
docker stop elasticsearch && docker rm elasticsearch
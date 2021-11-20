#! /bin/bash

INDEX_NAME="players_fifa_v1" 

echo "[`date`] starting elasticsearch"

docker run -d -p 127.0.0.1:9200:9200 \
    -e "discovery.type=single-node" \
    --net elastic-net \
    --name elasticsearch \
    docker.elastic.co/elasticsearch/elasticsearch:7.15.2 \

while [ $(curl -o /dev/null -s -w "%{http_code}\n" localhost:9200) -ne 200 ]
do
    echo "[`date`] waiting for status [200]"
    sleep 3
done

echo "[`date`] [elasticsearch] status OK"

echo "[`date`] adding index mapping template to elastic search"

response=$(curl -o /dev/null -X PUT -s -w "%{http_code}\n" localhost:9200/_index_template/template \
            -H "Content-Type: application/json" \
            -d @$(git rev-parse --show-toplevel)/mappings/mapping.json)

echo "[`date`] received status code [$response]"

echo "[`date`] starting logstash"

docker run  -d \
    -v $(git rev-parse --show-toplevel)/pipelines:/usr/share/logstash/pipeline/ \
    -v $(git rev-parse --show-toplevel)/data:/data \
    --net elastic-net \
    --name logstash \
    docker.elastic.co/logstash/logstash:7.15.2

while [ $(curl -o /dev/null -s -w "%{http_code}\n" localhost:9200/$INDEX_NAME) -ne 200 ]
do
    echo "[`date`] waiting for index creation"
    sleep 3
done

echo "[`date`] [index creation successfull]"

echo "[`date`] build flask middleware component"
docker build -f Dockerfile . -t middleware:1.0.0
echo "[`date`] build flask middleware component [DONE]"

echo "[`date`] start the middleare"

docker run  -d \
    -p 127.0.0.1:5000:5000 \
    --net elastic-net \
    --name flask-middleware \
    middleware:1.0.0

echo "[`date`] flask server can be reached at 127.0.0.1:5000 [DONE]"






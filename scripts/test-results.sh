#! /bin/bash

curl -X GET -s  -H "Content-Type: application/json" \
    localhost:5000/ \
    -d "{\"player-name\":\"${1}\"}" | jq '.'
## system requirements
* git
* pipenv
* python 3.7
* docker
* curl
* jq

## steps to show a replay(not actually running anything on your machine)
```bash
git clone https://github.com/sr-vishnu/docker-elasticsearch-logstash-python-shell-flask.git

cd docker-elasticsearch-logstash-python-shell-flask/demo

scriptreplay --timing=script-ts script-log
```

## steps to actually run the scripts
```bash
git clone https://github.com/sr-vishnu/docker-elasticsearch-logstash-python-shell-flask.git

cd docker-elasticsearch-logstash-python-shell-flask

./scripts/init-index-and-middleware.sh

./scripts/test-results.sh <name of the player to search for>

./scripts/teardown-environment.sh
```

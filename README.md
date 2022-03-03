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

cd elasticsearch_logstash_python_flask

./scripts/make-environmet.sh

./scripts/init-index-and-middleware.sh

./scripts/test-results.sh

./scripts/teardown-environment.sh
```

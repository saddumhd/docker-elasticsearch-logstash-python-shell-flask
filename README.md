## system requirements
* git
* pipenv
* python 3.7
* docker
* curl
* jq

## steps to show a replay(not actually running anything on your machine)
```bash
git clone https://github.com/sr-vishnu/elasticsearch_logstash_python_flask.git
cd elasticsearch_logstash_python_flask/demo
scriptreplay --timing=script-ts script-log
```

## steps to actually run the scripts
```bash
git clone https://github.com/sr-vishnu/elasticsearch_logstash_python_flask.git
cd elasticsearch_logstash_python_flask
./scripts/make-environmet.sh
./scripts/init-index-and-middleware.sh
./scripts/test-results.sh
./scripts/teardown-environment.sh
```

## results

```json
{
  "result": [
    {
      "Age": "22",
      "FullName": "Harry Kane",
      "Overall": "84"
    },
    {
      "Age": "21",
      "FullName": "Harry Kane",
      "Overall": "78"
    },
    {
      "Age": "20",
      "FullName": "Harry Kane",
      "Overall": "71"
    },
    {
      "Age": "22",
      "FullName": "Todd Kane",
      "Overall": "70"
    },
    {
      "Age": "21",
      "FullName": "Todd Kane",
      "Overall": "68"
    },
    {
      "Age": "20",
      "FullName": "Todd Kane",
      "Overall": "64"
    },
    {
      "Age": "24",
      "FullName": "Yann Boé-Kane",
      "Overall": "64"
    },
    {
      "Age": "23",
      "FullName": "Yann Boé-Kane",
      "Overall": "63"
    },
    {
      "Age": "23",
      "FullName": "Kane Hemmings",
      "Overall": "61"
    },
    {
      "Age": "21",
      "FullName": "Kane Ryan Ferdinand",
      "Overall": "60"
    }
  ]
}
```
## Notebook
[EXPLORATORY DATA ANALYSIS](https://nbviewer.org/github/sr-vishnu/elasticsearch_logstash_python_flask/blob/master/notebooks/notebook.ipynb)
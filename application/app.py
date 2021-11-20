import flask
from flask import Flask
from modules.client import ElasticSearch
from modules.transformers import Transformer

app = Flask(__name__)

@app.route('/',methods=["GET"])
def _middleware():
    """
    The entry point to the flask server
    """

    _data = flask.request.json
    _elasticsearch = ElasticSearch(
        "players_fifa_v1",
        _data
    )
    _results = _elasticsearch.execute()

    return Transformer.transform(_results)

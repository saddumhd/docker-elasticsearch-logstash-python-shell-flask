import requests
from .query import Query

class ElasticSearch:
    def __init__(self,index: str,request: dict ,host: str = "elasticsearch" , port: str = "9200"):
        self.HOST = host
        self.PORT = port
        self.INDEX = index
        self.REQUEST = request

    def execute(self) -> dict:
        """
        Function sends a get request to elasticsearch
        """
        _url = f"http://{self.HOST}:{self.PORT}/{self.INDEX}/_search"
        _query = Query(self.REQUEST).query
        _headers = {"Content-Type":"application/json"}

        try:
            print(_query)
            response = requests.get(_url,headers=_headers,json=_query)
            response.raise_for_status()
            return response.json()
        except Exception as e:
            print(e)
            print(response.reason)
            return {
                "dummy" : "dummy"
            }

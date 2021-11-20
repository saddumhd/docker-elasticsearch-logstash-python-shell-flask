
class Query:
    
    def __init__(self, _request: dict):
        self._search_term = _request.get("player-name", "")

    @property
    def query(self):
        """
        Function prepares an elasticsearch query
        """

        return {
            "_source": [
                "long_name",
                "overall",
                "dob"
            ],
            "sort": [
                {
                    "overall": "desc"
                }
            ],
            "size": 10,
            "query": {
                "match": {
                    "long_name": {
                        "query": self._search_term
                    }
                }
            }
        }

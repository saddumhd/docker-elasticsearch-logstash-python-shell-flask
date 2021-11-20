class Transformer:

    @staticmethod
    def transform(result: dict) -> list:
        """
        A func to transform the results to match the requirement
        """
        def _fix_key_names(record: dict) -> dict:
            """
            A Helper func to rename the keys of the result
            """
            return {
                "FullName": record.get("long_name"),
                "Age": record.get("dob"),
                "Overall": record.get("overall")
            }

        _data = result.get("hits").get("hits")

        print(_data)

        return {
            "result" : [
                _fix_key_names(record.get("_source"))
                for record in _data
            ]
        }
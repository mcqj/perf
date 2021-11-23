wrk.scheme = "https"
-- wrk.host   = "xxxxxxxxxx.execute-api.eu-west-1.amazonaws.com"
wrk.path   = "/default/middyTest"
wrk.method = "POST"
wrk.body   = '{ "key1": "value1", "key2": "value2" }'
wrk.headers["Content-Type"] = "application/json"

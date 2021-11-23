#autocannon -w 3 -d 10  -m POST -b '{"key1": "value1"}' -H "Content-Type: application/json" https://${API_ID}.execute-api.eu-west-1.amazonaws.com/default/middyTest
autocannon -d 10  -m POST -b '{"key1": "value1"}' -H "Content-Type: application/json" https:/${API_ID}.execute-api.eu-west-1.amazonaws.com/default/middyTest

go-wrk -d 10  -M POST -body '{"key1": "value1"}' -H "Content-Type: application/json" https://${API_ID}.execute-api.eu-west-1.amazonaws.com/default/middyTest

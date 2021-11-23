#! /bin/bash

### Functions

init_vars() {
  # DEV - Auth endpoint
  authurl=https://api.dev.nualang.com/users/authenticate
  # DEV - Cloudfront Endpoint
  #apiurl=https://api.dev.nualang.com/classrooms
  # DEV - Direct Endpoint
  apiurl=https://${API_ID}.execute-api.eu-west-1.amazonaws.com/dev
  # PROD - Auth Endpoint
  #authurl=https://api.nualang.com/users/authenticate
  # PROD - Cloudfront Endpoint
  #apiurl=https://api.nualang.com/classrooms
  # PROD - Direct Endpoint
  #apiurl=https://${API_ID}.execute-api.eu-west-1.amazonaws.com/prod
  username="xxxxxxxxx@fathomtech.io"
  password="XXXXXXXX123"
  token=$(curl -s --request POST $authurl \
    --data-raw "{\"username\": \"$username\", \"password\": \"$password\"}" \
    --header 'Content-Type: application/json' | jq -r .AuthenticationResult.IdToken)
  # echo Token is $token
}

init_vars
if [ "$1" = "-c" ] || [ "$1" = "--curl" ]; then
  curl ${apiurl} --header "Authorization: $token"
elif  [ "$1" = "-a" ] || [ "$1" = "--autocannon" ]; then
  autocannon -t 30 -d 60 ${apiurl} --headers Authorization=${token}
else
  echo
  echo "Usage: $0 options"
  echo "  -a || --auotcannon  Run autocannon to exercise API with default options"
  echo "  -c || --curl        Run curl to send single request to API"
fi
echo

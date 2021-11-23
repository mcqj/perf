# Performance Test Experiments

This directory contains scripts used to do performace testing of an API.

There are scripts to drive traffic to the API for
- [Autocannon](https://github.com/mcollina/autocannon)
- [wrk](https://github.com/wg/wrk)
- [go-wrk](https://github.com/tsliwowicz/go-wrk)

## Setting AWS API Gateway ID

```bash
export API_ID=xxx
```

## AutocCannon Usage

### Simple Script
```bash
./runAutocannon
```

### More Complex Example
```bash
./test.sh           # Will print a usage message displaying options
```

The `test.sh` script first authenticates a user and then drives traffic to the
courses API. Because the non-optimized API can be quite slow, the timeouts and
duration of the test do not use the Autocannon defaults as these were too short.

There is an option to issue a single query (with curl) to test if you are getting
any results before running an actual performance test.

Edit `test.sh` and modify the variables at the start of the script to customize
parameters and behaviour of the test.

## wrk Usage

```bash
wrk -c 10 -d 5 -s post.lua https://xxxxxxxxxx.execute-api.eu-west-1.amazonaws.com
```

## go-wrk Usage

```bash
go-wrk -d 10  -M POST -body '{"key1": "value1"}' -H "Content-Type: application/json" https://xxxxxxxxxx.execute-api.eu-west-1.amazonaws.com/default/middyTest
```

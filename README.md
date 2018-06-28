# twemproxy alpine Docker image build

## Build
You need docker 17.05 to be able to build

`docker build -t yourname/twemproxy:0.4.1 .`

## Running
Pass comma separated list of servers via ENV SERVERS

`docker run -e SERVERS=ip1:6379:1,ip2:6379:1 -it gojektech/twemproxy:0.4.1`

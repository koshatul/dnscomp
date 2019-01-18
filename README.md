# dnscomp
ISC DNS Compliance Testing in a docker container, based on the [DNS-Compliance-Testing](https://gitlab.isc.org/isc-projects/DNS-Compliance-Testing) isc-project

### Use
```
( echo "github.com"; echo "microsoft.com" ) | docker run -i --rm koshatul/dnscomp:latest -4
```

`( echo "github.com"; echo "microsoft.com" )` is the list of domains to check, you can also pipe in a file with a list of domains.

`docker run -i --rm koshatul/dnscomp:latest` is the docker command, specifying an interactive session, delete the container when finished and to use the latest koshatul/dnscomp:latest image.

`-4` is a command line parameter for [genreport](https://gitlab.isc.org/isc-projects/DNS-Compliance-Testing)

### Command line options for genreport
```
$ docker run --rm koshatul/dnscomp:cdf1045 --help
usage: genreport [-46abBcdeEfgGjLnopstT] [-i test] [-I test] [-m maxoutstanding] [-r server]
	-4: IPv4 servers only
	-6: IPv6 servers only
	-a: only emit all ok
	-b: only emit bad servers
	-B: only emit bad tests
	-c: add common queries
	-d: enable debugging
	-D: list test and DiG command
	-e: edns test
	-E: EDNS only
	-f: add full mode tests (incl edns)
	-g: look for glue (nameserver, address pairs)
	    then qualify matching zone, ns pairs
	-G: only use glue to qualify zone, ns pairs
	-i: individual test
	-I: remove individual test
	-j: emit json
	-L: list tests and their grouping
	-m: set maxoutstanding
	-n: printnsid
	-o: inorder output
	-p: parallelize tests
	-P: port to use, (default 53)
	-r: use specified recursive server
	-R: recursive mode
	-s: serialize tests
	-t: type tests (serial)
	-T: print type list for type test (-t)
	-u: unique IP address
```

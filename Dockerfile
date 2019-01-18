FROM ubuntu:bionic as builder

RUN apt-get update
# Only used in builder stage, don't care about other versions.
# hadolint ignore=DL3008,DL3015
RUN apt-get install -qy wget build-essential autoconf libssl-dev=1.1.0g-2ubuntu4.3 pkg-config
WORKDIR /code
RUN wget 'https://gitlab.isc.org/isc-projects/DNS-Compliance-Testing/-/archive/master/DNS-Compliance-Testing-master.tar.bz2'
RUN tar xvf DNS-Compliance-Testing-master.tar.bz2
WORKDIR /code/DNS-Compliance-Testing-master
RUN autoconf && autoreconf --install
RUN ./configure
RUN make

FROM ubuntu:bionic
RUN apt-get update \
 && apt-get install --quiet --yes --no-install-recommends libssl-dev=1.1.0g-2ubuntu4.3 \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
COPY --from=builder /code/DNS-Compliance-Testing-master/genreport /usr/bin/genreport
ENTRYPOINT ["/usr/bin/genreport"]

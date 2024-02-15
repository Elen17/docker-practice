FROM ubuntu

LABEL owner='elen_anahit'
LABEL description='Node-exporter Dockerfile'
LABEL version='v1'


ENV OS=linux
ENV ARC=amd64

ENV NODE_VERSION=1.7.0


ADD  https://github.com/prometheus/node_exporter/releases/download/v${NODE_VERSION}/node_exporter-${NODE_VERSION}.${OS}-${ARC}.tar.gz .


RUN  tar --strip-components=1 -cvzf  node_exporter-${NODE_VERSION}.${OS}-${ARC}.tar.gz -C ./


#RUN groupadd -f node_exporter && \
#   useradd -g node_exporter --shell /bin/false node_exporter && \
#  chown node_exporter:node_exporter /tmp/node_exporter-${NODE_VERSION}.${OS}-${ARC}

RUN  rm -rf /var/lib/apt/lists/*
#RUN rm -fr node_exporter-${NODE_VERSION}.${OS}-${ARC}*

EXPOSE 9100

CMD ["./node_exporter"]

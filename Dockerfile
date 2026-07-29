FROM powsybl/java:4.0.0
USER root
WORKDIR /
ARG DYNAWO_VERSION=1.7.0

RUN apt-get update && \
  apt-get install -y libgomp1 unzip && \
  apt-get clean

ADD https://github.com/dynawo/dynaflow-launcher/releases/download/v${DYNAWO_VERSION}/DynaFlowLauncher_Linux_v${DYNAWO_VERSION}.zip .
RUN unzip DynaFlowLauncher_Linux_v${DYNAWO_VERSION}.zip && \
  rm -f DynaFlowLauncher_Linux_v${DYNAWO_VERSION}.zip

WORKDIR /home/powsybl
USER powsybl

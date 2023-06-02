FROM powsybl/java:2.0.0
USER root
WORKDIR /
ARG DYNAWO_VERSION

RUN apt-get update && \
  apt-get install -y libgomp1 && \
  apt-get install unzip && \
  apt-get clean

RUN wget https://github.com/dynawo/dynawo/releases/download/v${DYNAWO_VERSION}/Dynawo_Linux_v${DYNAWO_VERSION}.zip && \
  unzip Dynawo_Linux_v${DYNAWO_VERSION}.zip && \
  rm -f Dynawo_Linux_v${DYNAWO_VERSION}.zip

RUN wget https://github.com/dynawo/dynaflow-launcher/releases/download/v${DYNAWO_VERSION}/DynaFlowLauncher_Linux_v${DYNAWO_VERSION}.zip && \
  unzip DynaFlowLauncher_Linux_v${DYNAWO_VERSION}.zip && \
  rm -f DynaFlowLauncher_Linux_v${DYNAWO_VERSION}.zip

WORKDIR /home/powsybl
USER powsybl

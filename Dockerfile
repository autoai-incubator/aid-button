FROM ubuntu:20.04

ARG AID_MODEL
ARG AID_VENDOR
ARG AID_PACKAGE
ARG AID_SOLVER

ENV AID_SOLVER=$AID_SOLVER
ENV AID_MODEL=$AID_MODEL
ENV AID_VENDOR=$AID_VENDOR
ENV AID_PACKAGE=$AID_PACKAGE

ENV PORT=8080
RUN apt-get update && apt-get install -y curl python3-pip
RUN curl https://releases.autoai.org/aid/install.sh | bash -s -- edge
RUN aid generate
RUN cd /root/.autoai/aid/models/$AID_VENDOR/$AID_PACKAGE && pip install -r requirements.txt
WORKDIR /root/.autoai/aid/models/$AID_VENDOR/$AID_PACKAGE
CMD python3 ./runner_${AID_SOLVER}.py 8080
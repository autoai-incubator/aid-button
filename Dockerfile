FROM ubuntu:20.04

ARG AID_MODEL
ARG AID_PORT
ENV AID_MODEL=$AID_MODEL
ENV AIDPORT=$AID_PORT
ENV PORT=$AID_MODEL
RUN apt-get update && apt-get install -y curl
RUN curl https://releases.autoai.org/aid/install.sh | bash -s -- edge
CMD "aid" "up" "--headless"
FROM ubuntu:20.04

ARG AID_MODEL
ENV AID_MODEL=$AID_MODEL
ENV PORT=8080
ENV AID_PORT=8080
RUN apt-get update && apt-get install -y curl
RUN curl https://releases.autoai.org/aid/install.sh | bash -s -- edge
CMD "aid" "up" "--headless"
ARG MODEL_URL
ARG PORT
FROM ubuntu:20.04
ENV MODEL_URL=$MODEL_URL
RUN echo ${MODEL_URL}
LABEL model=$MODEL_URL
RUN apt-get update && apt-get install -y curl
RUN curl https://releases.autoai.org/aid/install.sh | bash -s -- edge
RUN aid install $MODEL_URL
RUN aid up
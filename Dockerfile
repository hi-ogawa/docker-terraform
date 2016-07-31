FROM debian:jessie

RUN apt-get update && \
    apt-get install -y wget unzip && \
    rm -rf /var/lib/apt/lists/*

RUN wget -q https://releases.hashicorp.com/terraform/0.6.16/terraform_0.6.16_linux_amd64.zip
RUN unzip terraform_0.6.16_linux_amd64.zip -d /usr/local/bin

ENTRYPOINT ["terraform"]

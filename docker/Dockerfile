FROM alpine:3.13.4
LABEL maintainer="Nicolas Bayle"

RUN apk add --no-cache --virtual build-dependencies bash jq git curl python3-dev libffi-dev openssl-dev build-base \
    && apk add sshpass py3-pip bash \
    && wget https://releases.hashicorp.com/terraform/1.0.1/terraform_1.0.1_linux_amd64.zip \
    && unzip terraform_1.0.1_linux_amd64.zip \
    && rm terraform_1.0.1_linux_amd64.zip \
    && mv terraform /usr/bin/terraform \
    && pip3 install 'cryptography<=3' \
    && pip3 install --upgrade pip \
    && pip3 install ansible==2.9.12 \
    && pip3 install avisdk==18.2.9 \
    && pip3 install dnspython \
    && pip3 install netaddr \
    && ansible-galaxy install -f avinetworks.avisdk
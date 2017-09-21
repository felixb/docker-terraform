FROM alpine:3.6

ENV \
    SWAMP_VERSION=0.2 \
    TERRAFORM_VERSION=0.10.6

RUN apk -v --update add \
        python \
        py-pip \
        curl \
        && \
    pip install --upgrade awscli && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*

RUN curl -Lf https://github.com/felixb/swamp/releases/download/v${SWAMP_VERSION}/swamp_amd64 -o /usr/bin/swamp \
 && chmod +x /usr/bin/swamp

RUN curl -Lf https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o /tmp/terraform.zip \
 && unzip /tmp/terraform.zip -d /usr/bin/ \
 && rm /tmp/terraform.zip
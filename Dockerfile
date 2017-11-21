FROM amazonlinux:latest

ENV \
    SWAMP_VERSION=0.3 \
    TERRAFORM_VERSION=0.10.8

WORKDIR /workspace

# install aws cli
RUN yum install -y python-pip groff less unzip jq \
 && pip-python install --upgrade awscli \
 && yum remove -y python-pip \
 && yum clean all \
 && rm -rf /var/cache/yum

# install terraform
RUN curl -Lf https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o /tmp/terraform.zip \
 && unzip /tmp/terraform.zip -d /usr/bin/ \
 && rm /tmp/terraform.zip

# install swamp
RUN curl -Lf https://github.com/felixb/swamp/releases/download/v${SWAMP_VERSION}/swamp_amd64 -o /usr/bin/swamp \
 && chmod +x /usr/bin/swamp

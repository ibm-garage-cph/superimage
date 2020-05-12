FROM ubuntu:18.04

# General
RUN apt-get update
RUN apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y

# Docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
RUN apt-get update
RUN apt-get install docker-ce docker-ce-cli containerd.io -y

# IBM Cloud CLI
RUN curl -sL https://ibm.biz/idt-installer | bash

# Tekton
RUN curl -LO https://github.com/tektoncd/cli/releases/download/v0.9.0/tkn_0.9.0_Linux_x86_64.tar.gz
RUN tar xvzf tkn_0.9.0_Linux_x86_64.tar.gz -C /usr/local/bin/ tkn

# Openshift
RUN curl -LO https://mirror.openshift.com/pub/openshift-v4/clients/oc/4.3/linux/oc.tar.gz
RUN tar xvzf oc.tar.gz -C /usr/local/bin/ oc

CMD service docker start && /bin/bash -c 'while true;do sleep 3600;done'
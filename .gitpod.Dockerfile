# FROM gitpod/workspace-full:latest
FROM python:slim

RUN apt-get update \
    apt-get install -y awscli 

RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list \
    apt update && sudo apt install terraform
FROM python:3.6.9
RUN apt-get update && apt-get install -y sudo sshpass iputils-ping wget
WORKDIR /tmp/robot_dockercompose
COPY . .
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
# FROM jenkins/jenkins:latest
# Can be add :latest
# RUN jenkins-plugin-cli --plugins blueocean
FROM python:3.8
RUN apt-get update && apt-get install -y sudo sshpass iputils-ping wget
WORKDIR /tmp/robot_dockercompose_jenkins
COPY . .
COPY requirements.txt .
COPY wait-for-grid.sh .
RUN chmod +x wait-for-grid.sh
#RUN pip install --upgrade pip
RUN pip3 install -r requirements.txt
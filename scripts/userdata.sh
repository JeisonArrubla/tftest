#!/bin/bash
yum update -y
amazon-linux-extras enable docker
yum install -y docker git
service docker start
usermod -a -G docker ec2-user

git clone https://github.com/docker/awesome-compose.git /app
cd /app/react-nginx

sudo curl -L "https://github.com/docker/compose/releases/download/v2.24.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

docker-compose up -d

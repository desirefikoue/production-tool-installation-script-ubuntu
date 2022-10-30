#!/bin/bash 

sudo apt update -y

sudo cat /etc/system-release

sudo apt install -y httpd mariadb-server

sudo systemctl start httpd

sudo systemctl enable httpd

sudo systemctl is-enabled httpd

echo "Install Java JDK 8"
sudo apt remove -y java
sudo amazon-linux-extras install java-openjdk11

echo "Install git"
sudo apt install -y git

amazon-linux-extras install epel
sudo apt update -y
sudo apt install ansible -y
sudo apt update -y
sudo apt install nginx -y
sudo ufw app list
sudo ufw allow 'Nginx HTTP'
sudo ufw status
#systemctl status nginx
curl -4 icanhazip.com

curl "https://s3.amazonaws.com/aws-cli/awscli-bundle-1.16.312.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
sudo /usr/local/bin/python3.7 awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
aws --version
cd /home 
touch hug.yml 
touch nat.yml 

echo " Install Terraform"
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update -y && sudo apt install terraform -y
terraform --version

echo "Install Docker engine"
sudo apt update -y
sudo apt-get remove docker docker-engine docker.io containerd runc    -y 
sudo apt-get update  -y 
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
sudo apt-get update  -y 
sudo chmod a+r /etc/apt/keyrings/docker.gpg     -y 
sudo apt-get update  -y 
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin     -y 
sudo docker run hello-world 
sudo service docker start
sudo service docker enable
#sudo service docker status
#sudo usermod -a -G docker jenkins
#sudo service docker start

echo " install Alpine"


echo "Install Jenkins"
docker run \
  -u root \
  --rm \
  -d \
  -p 8080:8080 \
  -p 50000:50000 \
  --name myjenkin \
  -v jenkins-data:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkins/jenkins
   

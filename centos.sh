#!/bin/bash 

sudo apt -y update

sudo apt update -y

sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2

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
sudo apt install nginx -y
sudo apt install python-pip -y  
sudo apt install awscli 
sudo apt install boto -y 
cd /home 
touch hug.yml 
touch nat.yml 

echo " Install Terraform"
sudo apt install update -y 
sudo wget https://releases.hashicorp.com/terraform/1.1.2/terraform_1.1.2_linux_amd64.zip 
sudo unzip terraform_1.1.2_linux_amd64.zip
sudo mv terraform /usr/bin/
terraform --version

echo "Install Docker engine"
sudo apt update -y
sudo apt install docker -y
systemctl start docker
systemctl enable docker
systemctl status docker
#sudo usermod -a -G docker jenkins
#sudo service docker start
sudo chkconfig docker on

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
   

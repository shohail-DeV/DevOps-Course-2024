#!/bin/bash
pass=1234
echo "Installing Docker..."
sudo apt-get update -y
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

#Pull the latest mysql server
sudo docker pull mysql:latest
#Run the container using the above image
sudo docker run --name test-mysql -e MYSQL_ROOT_PASSWORD="${pass}" -d mysql
#run the container terminal using exec command and container name
sudo docker exec -it test-mysql bash
#inside the bash mysql can be executed as root using the command (mysql -u root -p) and a database can be created using (create database test);

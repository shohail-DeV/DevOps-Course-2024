#!/bin/bash
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
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#clone the to-do app

git clone https://github.com/docker/getting-started-app.git
#create dockerfile
cd getting-started-app
ls -lah
touch dockerfile
cat > dockerfile << EOF
# syntax=docker/dockerfile:1
FROM node:18-alpine
WORKDIR /app
COPY . .
RUN yarn install --production
CMD ["node", "src/index.js"]
EXPOSE 3000
EOF
#Build the image from the dockerfile
sudo docker build -t getting-started .
#Run the container from the image file created (use option 1 who are able to access through browser or use option 2)
#Option 1
#docker run -dp 127.0.0.1:3000:3000 getting-started
#Option 2
sudo docker run -dp 0.0.0.0:3000:3000 getting-started
#Display the public IP
publicIP=$(curl http://checkip.amazonaws.com)
echo "Access the To-do app using http://${publicIP}:3000"
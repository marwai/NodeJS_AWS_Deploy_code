#!/bin/bash


# update

  sudo apt-get update -y

# install Nginx
  sudo apt-get install nginx -y

# Client url (CURL) goes to the certain URL and takes the setup
  curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

# Installing Nodes
  sudo apt-get install -y nodejs
  sudo apt-get install npm -y

# Install the npm dependencies
  sudo apt-get update

# To get into the app folder, you need to navigate into the folder using package.json
  cd /home/ubuntu/app


  sudo npm install
  sudo npm install pm2 -g

# Pm2 manages the application
  pm2 stop app.js
  pm2 start app.js

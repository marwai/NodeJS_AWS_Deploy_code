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
  sudo npm install ejs, mongoose, express


# Configuring nginx proxy


# Maing the default file inactive
  sudo unlink /etc/nginx/sites-enabled/default # test

# remove the old file and add our one
  sudo rm /etc/nginx/sites-available/default # test
  sudo ln -s /home/ubuntu/environment/app/nginx.default /etc/nginx/sites-available/default # test
  sudo service nginx restart # test




# Connecting to local hosts
  export DB_HOST=mongodb://34.244.187.147:27017/posts
  sudo apt-get update

# To get into the app folder, you need to navigate into the folder using package.json
  cd /home/ubuntu/app

# Install the npm dependencies
  sudo npm install
  sudo npm install pm2 -g
  npm install
# Pm2 manages the application
  pm2 stop app.js
  pm2 stop all # works anywhere and not just in the folder
  pm2 start app.js -f

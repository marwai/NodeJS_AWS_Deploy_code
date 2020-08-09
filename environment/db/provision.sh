#!/bin/bash
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927
  echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

  sudo apt-get update -y
  sudo apt-get upgrade -y

# sudo apt-get install mongodb-org=3.2.18 -y
  sudo apt-get install -y mongodb-org=3.2.20 mongodb-org-server=3.2.20 mongodb-org-shell=3.2.20 mongodb-org-mongos=3.2.20 mongodb-org-tools=3.2.20

  sudo rm /etc/mongod.conf
# ln creates symbolic link
  sudo ln -s /home/ubuntu/db/mongod.conf /etc/mongod.conf

# If mongo is set up correctly
  sudo systemctl restart mongod
  sudo systemctl enable mongod

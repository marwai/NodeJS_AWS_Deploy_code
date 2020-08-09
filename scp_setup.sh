#!/bin/bash

  # scp -i ~/.ssh/DevOpsStudents.pem -r ~/PycharmProjects/NodeJS_AWS_Deploy_code/app/ ubuntu@ec2-3-250-221-64.eu-west-1.compute.amazonaws.com:/home/ubuntu/
  # scp -i ~/.ssh/DevOpsStudents.pem -r ~/PycharmProjects/NodeJS_AWS_Deploy_code/environment/provision.sh ubuntu@ec2-3-250-221-64.eu-west-1.compute.amazonaws.com:/home/ubuntu/
  # ssh -i ~/.ssh/DevOpsStudents.pem ubuntu@ec2-3-250-221-64.eu-west-1.compute.amazonaws.com


  # Scp moves the file into the virtual machine. Sinking OS to app folder in VM
  scp -i ~/.ssh/DevOpsStudents.pem -r ~/PycharmProjects/NodeJS_AWS_Deploy_code/app/ ubuntu@ec2-3-248-218-86.eu-west-1.compute.amazonaws.com:/home/ubuntu/

  # Syncing DB to VM first
  scp -i ~/.ssh/DevOpsStudents.pem -r ~/PycharmProjects/NodeJS_AWS_Deploy_code/environment/db/ ubuntu@ec2-34-244-187-147.eu-west-1.compute.amazonaws.com:/home/ubuntu/ # test

  # syncing APP provisions folder to vm
  scp -i ~/.ssh/DevOpsStudents.pem -r ~/PycharmProjects/NodeJS_AWS_Deploy_code/environment/app/ ubuntu@ec2-3-248-218-86.eu-west-1.compute.amazonaws.com:/home/ubuntu/

  # SSH DB first
  ssh -i ~/.ssh/DevOpsStudents.pem ubuntu@ec2-34-244-187-147.eu-west-1.compute.amazonaws.com -i $ ./provision.sh

  # SSH APP into virtual machine ( runs the pm2 start)
  ssh -i ~/.ssh/DevOpsStudents.pem ubuntu@ec2-3-248-218-86.eu-west-1.compute.amazonaws.com  -i $ ./provision.sh
  # -i $ ./provision.sh has to be on samex line. Otherwise it would exit the VM
  # $ runs the command



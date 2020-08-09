#!/bin/bash

  # scp -i ~/.ssh/DevOpsStudents.pem -r ~/PycharmProjects/NodeJS_AWS_Deploy_code/app/ ubuntu@ec2-3-250-221-64.eu-west-1.compute.amazonaws.com:/home/ubuntu/
  # scp -i ~/.ssh/DevOpsStudents.pem -r ~/PycharmProjects/NodeJS_AWS_Deploy_code/environment/provision.sh ubuntu@ec2-3-250-221-64.eu-west-1.compute.amazonaws.com:/home/ubuntu/
  # ssh -i ~/.ssh/DevOpsStudents.pem ubuntu@ec2-3-250-221-64.eu-west-1.compute.amazonaws.com


  # Scp moves the file into the virtual machine. Sinking OS to app folder in VM
  scp -i ~/.ssh/DevOpsStudents.pem -r ~/PycharmProjects/NodeJS_AWS_Deploy_code/app/ ubuntu@ec2-34-244-187-147.eu-west-1.compute.amazonaws.com:/home/ubuntu/

  # syncing provisions folder to vm
  scp -i ~/.ssh/DevOpsStudents.pem -r ~/PycharmProjects/NodeJS_AWS_Deploy_code/environment/app/ ubuntu@ec2-34-244-187-147.eu-west-1.compute.amazonaws.com:/home/ubuntu/

  # Syncing db folder to vm
  scp -i ~/.ssh/DevOpsStudents.pem -r ~/PycharmProjects/NodeJS_AWS_Deploy_code/environment/db/provision.sh ubuntu@ec2-34-244-187-147.eu-west-1.compute.amazonaws.com:/home/ubuntu/


  # SSH into virtual machine ( runs the pm2 start)
  # ssh -i ~/.ssh/DevOpsStudents.pem ubuntu@ec2-34-249-26-90.eu-west-1.compute.amazonaws.com # -i $ ./provision.sh
  # -i $ ./provision.sh has to be on same line. Otherwise it would exit the VM
  # $ runs the command


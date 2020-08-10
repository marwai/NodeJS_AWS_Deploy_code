# Running A Node JS Application On An EC2 Instance

####  [Detailed guide](/Detailed-guide.md) for more detail on AWS 

## Prerequisites
- Download [Git Bash](https://git-scm.com/downloads)

Before jumping into AWS, there is some software that needs to be downloaded for this project. Git offer a command line that is designed
to execute on a unix style line environment. Once this is installed, you may begin your journey to AWS and cloud computing


## Creating an EC2 instance
- Given you have created an AWS account, go to the dashboard and click running instances
- Then choose the machine and configurations appropriate to your project. If you are running an individual project, it is 
recommended to run T2 micro machine for cost efficiency. 
 
![E21](images/E21.png)


## Clone the Repository
- Download and extract the zip file and move it to a safe file location
- It is recommended to make a location where all your code is stored*

## Entering Our Cloud Machine and Running Our Application

- The zip folder would have most likely gone to your downloads folder

- Open git bash and locate to the folder where you have saved this cloned repository


1. The following command will run a provision script that would then run the application

        $ ./scp_setup.sh
     
2. Once in the vm, enter the command below to run the provision folder  

        $ ./provision.sh

# Working code

![picutre](images/proof%20of%20working%20code%20with%20mongodb.PNG)



## __Errors__ and Solutions 
If there are no errors, skip to the next steps

(1) If mongod.conf is not found in /etc folder

        cd/etc
    
    
(2)  mongod.conf was red - file is not there, can't add to file, fix this by:

    rm the mongod.conf and nano mongod.conf again 


(3) PASTE INTO MONGOD 	
    
    # mongod.conf
    # for documentation of all options, see:
    #   http://docs.mongodb.org/manual/reference/configuration-options/
    
    # Where and how to store data.
    storage:
      dbPath: /var/lib/mongodb
      journal:
        enabled: true
    #  engine:
    #  mmapv1:
    #  wiredTiger:
    
    # where to write logging data.
    systemLog:
      destination: file
      logAppend: true
      path: /var/log/mongodb/mongod.log
    
    # network interfaces
    net:
      port: 27017
      bindIp: 0.0.0.0
    
    
    #processManagement:
    
    #security:
    
    #operationProfiling:
    
    #replication:
    
    #sharding:
    
    ## Enterprise-Only Options:
    
    #auditLog:
    
    #snmp:

(4) restart mongod and check the server is active  

        $ sudo systemctl restart mongod
        # Access denied so run sudo systemctl restart mongod 
        $ systemctl status mongod 

(5) check environment variables.
        
    $ env  
 
 (6) In provision env variable is set up, however env is not set up in the vm app folder, hence to be done manually:
 to create env variable,This should've been there, the db host 

    # EXPORT THIS IN THE APP SSH 
    $ export DB_HOST=mongodb://ubuntu@34.244.187.147:27017/posts?authSource=admin


Posts is still not there because ssh has been reboot and sync folders. Rebooting, means the following steps have to repeated 

wait a few minutes before SSH into again 

    export DB_HOST=mongodb://34.244.187.147:27017/posts

NPM install in the app folder with json folder 

    npm install
NOTES TO KEEP

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

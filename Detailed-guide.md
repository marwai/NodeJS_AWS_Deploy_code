# Environments
An environment in terms of programming is a location where we would deploy the code. There can be several different environments.

Overview
- Notes
    - [What is AWS?](What-is-AWS?)
- Instructions
    - [Creating a E2 Instance](Creating-an-instance)
    - [Provisioning](#Provisioning)
    - [Commands for Syncing the OS and VM and entering the vm](#Commands-for-Syncing-the-OS-and-VM-and-entering-the-vm)

# What is AWS?

Amazon Web Services is a cloud computing platform provides an array of cloud services. We can define AWS (Amazon Web 
Services) as a secured cloud services platform.

Aws is the infrastructure as a service, One key thing it provides is a global infrastructure.
Allows us to rent infrastructure per second.

# Full Guide of Instructions

## Creating a E2 instance

#### Once on the AWS dashboard, click on services and then under computer select EC2
![E21](images/E21.png)

#### Now we can select the VM we want to create. In my case I choose the Ubuntu machine as it was the closest to my testing environment
![E22](images/E22.png)

# Entering the Instance
1. First download the file to enter the EC2 instance
2. The folder will be found in the downloads folder. In Git Bash run  the following command in the terminal 
    $ cd
    $ cd downloads/ 
   
3. Move the folder into a safe location where the ```.ssh keys``` are stored
       
       $ mv DevOpsStudents\ \(2\).pem ~/.ssh
    ```mv``` moves the ```DevOpsStudents\ \(2\).pem``` into ```~```  (home directory) 
    and finally into the ssh folder  

4. __Enter the .ssh folder__   
   The ```.```ssh means the folder is hidden. However you are a developer so you have the power to changing, 
deleting, or moving around 
what you please, but with care*
 
        $ cd ~/.ssh
    
5. You can enter run the Secure shell command to enter the EC2 virtual machine 

        ssh -i ~/.ssh/DevOpsStudents\ \(2\).pem ubuntu@52.214.19.30
    
    
# Provisioning

![prov1](images/prov1.png)

# Naming Value
In AWS Name the keys an appropriate name:value key to distinguish your own own work with others like the example below 
![name:value key](images/)

2) Direct inside the directory use the ```ls ``` command to confirm your location
3) use the ```cd environment``` command to enter the directory
4) Create a provisions.sh file or enter your file using ```nano provisions.sh```


```python


sudo unlink /etc/nginx/sites-enabled/default
cd /etc/nginx/sites-available
sudo touch reverse-proxy.conf
sudo chmod 666 reverse-proxy.conf
echo "server{
  listen 80;
  location / {
      proxy_pass http://192.168.10.100:3000;
  }
}" >> reverse-proxy.conf
sudo ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf
sudo service nginx restart

#### installing git
sudo apt-get install git -y

#### installing nodejs
sudo apt-get install python-software-properties
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs -y

#### installing pm2
sudo npm install pm2 -g


#### App set up
export DB_HOST="mongodb://192.168.10.150:27017/posts"
cd /home/ubuntu/app
sudo su
npm install

```
Provisions allow for the automation of the following:
- Provisioning folders
- Installing packages/sw
- Making configurations (like symlinks and writing to config files)
- Environment variables

This provisions file automates th installation, configuration and upgrading of Nginx, NPM, Git, pm2 and nodejs



# Commands for Syncing the OS and VM and entering the vm


#### SCP will be implemented
Secure copy protocol (SCP) is a means of securely transferring computer files between a local host and a remote host or 
between two remote hosts. It is based on the Secure Shell (SSH) protocol. 

### The below commands are typed into the OS

To sync directory from your OS to your VM you mut know the VMs IP address and the directory name of which you want to
 sync. use the following command:


Now we sync the environments directory as our ```provision.sh``` file is inside:


If an error occurs when trying to sinc use the following command:


Once the provision and app directorys have been moved into the VM. inside the VM we can run ```node app.js```

If successful the ```server listening on port 3000```
Once the connection has been successful you should be able to access the webpage through your ipv4 address created using a E2 instance on AWS.


The webpage is available through the e2 instances IP address using the port 3000

## Security Group/Firewall
Firewall is a network security system that monitors and controls incoming and outgoing network traffic based on 
predetermined security rules. A firewall typically establishes a barrier between a trusted internal network and 
untrusted external network, such as the Internet.
    - list of IPS that are trusted to be used for system 
    - Access to the instance regarding the IP address







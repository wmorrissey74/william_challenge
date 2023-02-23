# william_challenge

### Description

#### TERRAFORM
Terraform to create network, aws_instance, and an application load balancer with self signed certificates available on port 443 with port 80 forwarding to 443.

##### Terraform Requirements
- terraform 0.13.7
- awscli

###### Installation
awscli can be configured or variables exported
```
export AWS_ACCESS_KEY_ID=<aws testing account key id>
export AWS_SECRET_ACCESS_KEY=<aws testing account secret key>
export AWS_REGION=us-east-2
```

#### ANSIBLE
Ansible files included to install, start and test nginx and deploy custom web site to ec2 server.


##### Ansible Requirements
- ec2 host Ip address - added to hosts file
- private key to log on to host


### Terraform Files:

- alb.tf - deploys the load balancer, creates and attaches a self-signed certificate.
- main.tf - aws_instance deployment
- network.tf - some network bits
- privateKey.key -private key for self-signed certificate
- providers.tf - aws and terraform providers
- README.md - this file
- security_groups.tf - security group
- variables.tf


# Final-Project22
Final Project: Two-Tier web application automation with Terraform

[![Lint](https://github.com/ACS730-Grp9/Final-Project22/actions/workflows/tflint.yml/badge.svg)](https://github.com/ACS730-Grp9/Final-Project22/actions/workflows/tflint.yml)

## Pre-requisites

1- create s3 bucket from AWS console to host the terrafrom state file and replace the bucket name in the below files 
  - network/config.tf

2- create a key for ssh:
 - ssh-keygen -t rsa -f network/key

3- create a s3 bucket for the images with name `acs730-group9-${env}-kb`, replace ${env} with the correspoing environemnt(dev,stagingm,prod) and then upload the images to the bucket in path `images/`

## to deploy the infrastrcture:

1- to deploy pord navigate to network folder and run:
- terraform init
- terraform plan
- terraform apply --auto-aprove

## cleanup

1- to destory all the created resources to save cost
- terraform init
- terraform destroy --auto-aprove

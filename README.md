# Final-Project22
Final Project: Two-Tier web application automation with Terraform

[![Lint](https://github.com/ACS730-Grp9/Final-Project22/actions/workflows/tflint.yml/badge.svg)](https://github.com/ACS730-Grp9/Final-Project22/actions/workflows/tflint.yml)

[![tfsec](https://github.com/ACS730-Grp9/Final-Project22/actions/workflows/tfsec.yml/badge.svg)](https://github.com/ACS730-Grp9/Final-Project22/actions/workflows/tfsec.yml)

## Pre-requisites

1- create s3 bucket from AWS console to host the terrafrom state file and replace the bucket name in the below files 
  - network/config.tf

2- create a key for ssh:
 - ssh-keygen -t rsa -f network/key


## to deploy the infrastrcture:

1- to deploy pord navigate to network folder and run:
- terraform init
- terraform plan
- terraform apply --auto-aprove

## cleanup

1- to destory all the created resources to save cost
- terraform init
- terraform destroy --auto-aprove
# Static Site on S3

A static site deployed on s3 with a custom domain.

## Table of Contents
---
 * [Introduction]()
 * [Requirements](#requirements)
 * [Installation](#installation)

## Requirements
- Terraform
- AWS CLI


## Installation

1. Use [terraform](https://pip.pypa.io/en/stable/) to installise the folder.

```bash
# intialises the folder
terraform init
```
3. ensure you have connectivity to AWS via the CLI.

4. create terraform.tfvars file with proper values (the necessary variables can be found in the variables.tf file)

5. create tfplan
```bash
# creates plan file
terraform plan -out plan-name.tfplan
```
6. apply tfplan
```bash
# creates plan file
terraform apply plan-name.tfplan
```

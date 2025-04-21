# Setup a Jenkins controller on EC2

## Pre-reqs

- Install Terraform and Azure cli
- Create a Resource Group, Storage Account, and Blob Container
- Create an SSH key on Azure called `jenkins_kp` and download the private key file to the root of this repo. You will also need the public key in a later step.

## Build the infra
- Clone this repo locally
- Run the following commands from the root of the repo
```
cp ./templates/template.tfvars terraform.tfvars
cp ./templates/template.tf custom.tf
```
- Using the comments within each file, customize the information in the newly created files `terraform.tvars` and `custom.tf`. FYI, Github will ignore these files.
- Login to Azure CLI via `az login`. Check with `az account show`
- Build the infra with the commands below
```
terraform init
terraform apply -auto-approve
```
- Connect via ssh by getting the command from the Azure portal: Virtual Machines > jenkins-vm > Connect > Connect > Native SSH. The command should look like this
```
ssh -i jenkins_kp.pem azureuser@128.128.128.128
```
- Get the Jenkins init password
```
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
- In a browser, open Jenkins on port 8080. The URL should look like this
```
http://128.128.128.128:8080
```
- Login with the init password.
- Install suggested plugins.
- Choose a password and other login info.

## Destroy the infra

```
terraform destroy -auto-approve
```
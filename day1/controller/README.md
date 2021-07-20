# vmwAviController

## Goal
Terraform / Ansible | Deploy Avi Controller Cluster on vCenter environment and configure it.


## Prerequisites if you want to use on your Linux VM:
- TF installed in the orchestrator VM
- Ansible installed in the orchestrator VM
- Avi Ansible role installed
```
ansible-galaxy install -f avinetworks.avisdk
```

## Prerequisites if you want to use on the top of docker:
```
cd ~ ; git clone https://github.com/tacobayle/aviArchitectureWorkshop
cd aviArchitectureWorkshop/docker/ ; docker build . -t alpine-avi ; cd -
```

## Environment:

Terraform Plan has  been tested against:

### terraform

```
Terraform v0.13.5
+ provider registry.terraform.io/hashicorp/null v3.0.0
+ provider registry.terraform.io/hashicorp/vsphere v1.24.3
```

### Ansible

```
ansible 2.9.12
  config file = /etc/ansible/ansible.cfg
  configured module search path = [u'/home/ubuntu/.ansible/plugins/modules', u'/usr/share/ansible/plugins/modules']
  ansible python module location = /home/ubuntu/.local/lib/python2.7/site-packages/ansible
  executable location = /home/ubuntu/.local/bin/ansible
  python version = 2.7.17 (default, Sep 30 2020, 13:38:04) [GCC 7.5.0]
```

### Avi Version
```
controller-20.1.4-9087.ova
```

### Ansible Avi Role
```
- avinetworks.avisdk, 20.1.2-beta
```

## Input/Parameters:
- All the variables are stored in variables.json
- Environment variables:
```
export TF_VAR_vsphere_username=******
export TF_VAR_vsphere_password=******
export TF_VAR_avi_password=******
export TF_VAR_avi_backup_passphrase=******
```

## Use the terraform plan to:
- Create a new folder within v-center - TF
- Spin up n Avi Controller in the new folder - TF - the count is defined by the amount of fixed IP defined in var.controller.mgmt_ips
- Wait for the https to be ready - TF
- Bootstrap the Avi controller - Ansible
- Make the Avi controller cluster config - Ansible - floating IP will be configured if var.controller.floating_ip has been defined
- Configure Avi Passphrase - Ansible
- Configure System config - Ansible

## Run TF Plan on your linux host:
- Git clone the TF plan
```
cd ~ ; git clone https://github.com/tacobayle/vmwAviController ; cd aviVmw ; terraform init ;
```
- Change the variables.json according to your environment
- Build the plan
```
terraform apply -auto-approve
```
- Destroy the plan
```
terraform destroy -auto-approve
```

## Apply TF Plan on the top of docker:
```
cd ~ ; cd aviArchitectureWorkshop/day1/controller
docker run -it --env TF_VAR_vsphere_username=$TF_VAR_vsphere_username --env TF_VAR_vsphere_password=$TF_VAR_vsphere_password --env TF_VAR_avi_password=$TF_VAR_avi_password --env TF_VAR_avi_backup_passphrase=$TF_VAR_avi_backup_passphrase -v $PWD:/home alpine-avi /bin/bash -c 'terraform apply -auto-approve -var-file=variables.json'
```

## Destroy TF Plan on the top of docker:
```
git clone https://github.com/tacobayle/aviArchitectureWorkshop
cd day1/controller
docker run -it --env TF_VAR_vsphere_username=$TF_VAR_vsphere_username --env TF_VAR_vsphere_password=$TF_VAR_vsphere_password --env TF_VAR_avi_password=$TF_VAR_avi_password --env TF_VAR_avi_backup_passphrase=$TF_VAR_avi_backup_passphrase -v $PWD:/home alpine-avi /bin/bash -c 'terraform destroy -auto-approve -var-file=variables.json'
```
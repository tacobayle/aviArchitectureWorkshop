# Building an Avi Controller cluster through Automation

## Prerequisites

### packages

```
sudo apt install -y docker.io jq
```

### build your docker image:
```
cd ~ ; git clone https://github.com/tacobayle/aviArchitectureWorkshop
cd aviArchitectureWorkshop/docker/ ; docker build . -t alpine-avi ; cd -
```

## Environment:

### Avi Version
```
controller-20.1.6-9132.ova
```

## Input/Parameters:
- All the variables are stored in variables.json
- Environment variables for sensitive variables::
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

## Apply TF Plan:
```
cd ~ ; cd aviArchitectureWorkshop/day1/01controller
docker run -it --env TF_VAR_vsphere_username=$TF_VAR_vsphere_username \
               --env TF_VAR_vsphere_password=$TF_VAR_vsphere_password \
               --env TF_VAR_avi_password=$TF_VAR_avi_password \
               --env TF_VAR_avi_backup_passphrase=$TF_VAR_avi_backup_passphrase \
               -v $PWD:/home -v $PWD:/home \
               -v $(dirname $(jq -r .vcenter.content_library.file variables.json)):/home/bin alpine-avi \
               /bin/bash -c 'cd /home ; terraform init ; terraform apply -auto-approve -var-file=variables.json'
```

## Destroy TF Plan:
```
git clone https://github.com/tacobayle/aviArchitectureWorkshop
cd day1/controller
docker run -it --env TF_VAR_vsphere_username=$TF_VAR_vsphere_username --env TF_VAR_vsphere_password=$TF_VAR_vsphere_password --env TF_VAR_avi_password=$TF_VAR_avi_password --env TF_VAR_avi_backup_passphrase=$TF_VAR_avi_backup_passphrase -v $PWD:/home alpine-avi /bin/bash -c 'terraform destroy -auto-approve -var-file=variables.json'
```
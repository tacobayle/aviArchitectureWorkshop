# Configure Avi vCenter cloud through Automation

## Prerequisites

01controller must have been done

## Environment:

### Avi Version
```
controller-20.1.6-9132.ova
```

## Input/Parameters:
- All the variables are stored in variables.json
- Environment variables for sensitive variables:
```
export TF_VAR_vsphere_username=******
export TF_VAR_vsphere_password=******
export TF_VAR_avi_password=******
```


```
docker run -it --env TF_VAR_vsphere_username=$TF_VAR_vsphere_username \
               --env TF_VAR_vsphere_password=$TF_VAR_vsphere_password \
               --env TF_VAR_avi_password=$TF_VAR_avi_password \
               -v $PWD:/home -v $PWD:/home \
               /bin/bash -c 'cd /home ; ansible-playbook ansible/main.yml --extra-vars \'{\"avi_version\": $(terraform output -json | jq .avi_version.value), \"avi_controller\": $(terraform output -json | jq .controllers_ip.value[0]), \"avi_password\": \"$TF_VAR_avi_password\", \"vsphere_username\": \"$TF_VAR_vsphere_username", \"vsphere_password\": \"$TF_VAR_vsphere_password\"}\''
```
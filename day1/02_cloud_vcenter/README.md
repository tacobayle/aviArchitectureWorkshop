# Configure Avi vCenter cloud through Automation

## Prerequisites

01_controller must have been done

## Environment:

### Avi Version
```
controller-20.1.6-9132.ova
```

## Input/Parameters:
- All the variables are stored in variables.json
- Environment variables for sensitive variables:
```
export TF_VAR_vsphere_password=******
export TF_VAR_avi_password=******
```


# Configure Avi vCenter Cloud:
```
cd ~ ; cd aviArchitectureWorkshop
docker run -it --env TF_VAR_vsphere_password=$TF_VAR_vsphere_password \
               --env TF_VAR_avi_password=$TF_VAR_avi_password \
               -v $PWD:/home alpine-avi \
               /bin/bash -c 'cd /home/day1/01_controller ; ansible-playbook ../02_cloud_vcenter/pbCloudVmw.yml --extra-vars "{\"avi_version\": $(terraform output -json | jq .avi_version.value), \"avi_controller\": $(terraform output -json | jq .controllers_ip.value[0]), \"avi_password\": \"$TF_VAR_avi_password\", \"vsphere_password\": \"$TF_VAR_vsphere_password\"}" --extra-vars @../02_cloud_vcenter/variables.json'
```
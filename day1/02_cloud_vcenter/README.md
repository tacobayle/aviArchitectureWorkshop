# Configure Avi vCenter cloud through Automation

## Prerequisites

day1/01_controller must have been done

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
               -v $PWD:/home \
               alpine-avi \
               /bin/bash -c 'cd /home ; ansible-playbook day1/02_cloud_vcenter/pbCloudVmw.yml --extra-vars "{\"avi_password\": \"$TF_VAR_avi_password\", \"vsphere_password\": \"$TF_VAR_vsphere_password\"}" --extra-vars @terraform.json --extra-vars @day1/02_cloud_vcenter/variables.json'
```
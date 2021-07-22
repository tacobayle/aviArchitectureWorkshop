# Update Avi vCenter cloud with IPAM and DNS profile through Automation

## Prerequisites

day1/01_controller must have been done
day1/02_cloud_vcenter must have been done
day2/01DNSIPAM must have been done


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


# Update Avi vCenter Cloud with IPAM and DNS profile:
```
cd ~ ; cd aviArchitectureWorkshop
docker run -it --env TF_VAR_vsphere_password=$TF_VAR_vsphere_password \
               --env TF_VAR_avi_password=$TF_VAR_avi_password \
               -v $PWD:/home alpine-avi \
               /bin/bash -c 'cd /home ; ansible-playbook day2/02_cloud_vcenter_update/pbCloudUpdate.yml --extra-vars "{\"avi_password\": \"$TF_VAR_avi_password\", \"vsphere_password\": \"$TF_VAR_vsphere_password\"}" --extra-vars @terraform.json --extra-vars @day2/02_cloud_vcenter_update/variables.json'
```
# Create/Update Service Engine Group through Automation

## Prerequisites

## Input/Parameters:
- All the variables are stored in variables.tf
- Environment variables for sensitive variables:
```
export TF_VAR_avi_password=******

```

# Update Avi vCenter Cloud with IPAM and DNS profile:
```
cd ~ ; cd aviArchitectureWorkshop
docker run -it --env TF_VAR_avi_password=$TF_VAR_avi_password \
               -v $PWD:/home alpine-avi \
               /bin/bash -c 'cd /home ; ansible-playbook day2/03_seg/pbSeg.yml --extra-vars "{\"avi_password\": \"$TF_VAR_avi_password\"}" --extra-vars @terraform.json --extra-vars @day2/03_seg/variables.json'
```
# Configure Avi no access cloud through Automation

## Prerequisites

01_controller must have been done

## Input/Parameters:
- All the variables are stored in variables.json
- Environment variables for sensitive variables:
```
export TF_VAR_avi_password=******
```

# Configure Avi vCenter Cloud:
```
cd ~ ; cd aviArchitectureWorkshop
docker run -it --env TF_VAR_avi_password=$TF_VAR_avi_password \
               -v $PWD:/home alpine-avi \
               /bin/bash -c 'cd /home ; ansible-playbook day1/03_cloud_no_access/pbCloudNoAccess.yml --extra-vars "{\"avi_password\": \"$TF_VAR_avi_password\"}" --extra-vars @terraform.json --extra-vars @day1/03_cloud_no_access/variables.json'
```
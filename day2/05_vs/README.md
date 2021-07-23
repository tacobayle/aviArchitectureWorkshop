# Configure Avi VS

## Prerequisites

day1/01_controller must have been done
day1/02_cloud_vcenter must have been done
day2/01_DNSIPAM
day2/02_cloud_vcenter_update
day2/03_seg
day2/04_app

## Input/Parameters:
- All the variables are stored in variables.json
- Environment variables for sensitive variables:
```
export TF_VAR_avi_password=******
```

# Configure Avi Vs:
```
cd ~ ; cd aviArchitectureWorkshop
docker run -it --env TF_VAR_avi_password=$TF_VAR_avi_password \
               -v $PWD:/home alpine-avi \
               /bin/bash -c 'cd /home ; ansible-playbook day2/05_vs/pbVs.yml --extra-vars "{\"avi_password\": \"$TF_VAR_avi_password\"}" --extra-vars @terraform.json --extra-vars @app.json --extra-vars @day2/05_vs/variables.json'
```
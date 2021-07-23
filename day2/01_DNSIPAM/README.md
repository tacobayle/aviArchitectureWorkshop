# Configure Avi DNS and IPAM Profile

## Prerequisites

day1/01_controller must have been done
day1/02_cloud_vcenter must have been done

## Input/Parameters:
- All the variables are stored in variables.json
- Environment variables for sensitive variables:
```
export TF_VAR_avi_password=******
```

# Configure Avi DNS and IPAM Profile:
```
cd ~ ; cd aviArchitectureWorkshop
docker run -it --env TF_VAR_avi_password=$TF_VAR_avi_password \
               -v $PWD:/home alpine-avi \
               /bin/bash -c 'cd /home ; ansible-playbook day2/01_DNSIPAM/pbDnsIpamVmw.yml --extra-vars "{\"avi_password\": \"$TF_VAR_avi_password\"}" --extra-vars @terraform.json --extra-vars @day2/01_DNSIPAM/variables.json'
```
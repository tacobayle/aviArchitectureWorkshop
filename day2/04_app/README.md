# Creating a basic App through Automation

## Input/Parameters:
- All the variables are stored in variables.tf
- Environment variables for sensitive variables:
```
export TF_VAR_vsphere_password=******
export TF_VAR_docker_registry_username=******
export TF_VAR_docker_registry_password=******



```

## Use the terraform plan to:
- Create a new basic app - TF

## Apply TF Plan:
```
cd ~ ; cd aviArchitectureWorkshop
docker run -it --env TF_VAR_vsphere_password=$TF_VAR_vsphere_password \
               --env TF_VAR_docker_registry_username=$TF_VAR_docker_registry_username \
               --env TF_VAR_docker_registry_password=$TF_VAR_docker_registry_password \
               -v $PWD:/home \
               alpine-avi \
               /bin/bash -c 'cd /home/day2/04_app ; terraform init ; terraform apply -auto-approve ; terraform output -json | tee ../../app.json'
```

## Destroy TF Plan:
```
cd ~ ; cd aviArchitectureWorkshop
docker run -it --env TF_VAR_vsphere_password=$TF_VAR_vsphere_password \
               --env TF_VAR_docker_registry_username=$TF_VAR_docker_registry_username \
               --env TF_VAR_docker_registry_password=$TF_VAR_docker_registry_password \
               -v $PWD:/home \
               alpine-avi \
               /bin/bash -c 'cd /home/day2/04_app ; terraform init ; terraform destroy -auto-approve'
```

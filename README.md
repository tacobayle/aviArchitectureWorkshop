# Prerequisites

## packages

```
sudo apt install -y docker.io jq
sudo groupadd docker
sudo usermod -aG docker $USER
```

## build your docker image:
```
cd ~ ; rm -fr aviArchitectureWorkshop
cd ~ ; git clone https://github.com/tacobayle/aviArchitectureWorkshop
cd ~/aviArchitectureWorkshop/docker/ ; docker build . -t alpine-avi ; cd -
```

## Compatibility:

### Avi Version
```
controller-20.1.6-9132.ova
```
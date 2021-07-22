# Prerequisites

## packages

```
sudo apt install -y docker.io jq
```

## build your docker image:
```
cd ~ ; git clone https://github.com/tacobayle/aviArchitectureWorkshop
cd aviArchitectureWorkshop/docker/ ; docker build . -t alpine-avi ; cd -
```

## Compatibility:

### Avi Version
```
controller-20.1.6-9132.ova
```
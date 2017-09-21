# docker-terraform
Docker base image for running terraform (in AWS CodeBuild)

## Usage:

```bash
$ docker run -ti -v ${PWD}:/workspace -v ${HOME}/.aws:/root/.aws felixb/terraform
# terraform init
# terraform plan
# terraform apply
```
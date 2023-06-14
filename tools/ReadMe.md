## Install AWS CLI
Install Guide [Found Here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
### Linux
```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```
### Mac OSX
```bash
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
```

### Post Install guide
Full guide can be [Found Here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-quickstart.html#getting-started-quickstart-new)

## Install TF
### Linux
Install Guide [Found Here](https://learn.hashicorp.com/tutorials/terraform/install-cli)
```bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform
terraform -install-autocomplete
```
### Mac OSX
Install Guide [Found Here](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

```cli
aws configure
```
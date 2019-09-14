# Terraform Azure Workshop :fire: 

## Prerequisite
1. Install Terraform for your system via https://www.terraform.io/downloads.html
2. Once the binary is downloaded on your system, unzip it and move the binary to `/usr/local/bin`

1. Follow https://docs.microsoft.com/en-gb/azure/virtual-machines/linux/terraform-install-configure
This will setup your azure account to be used with terraform.
2. Next setup your local env variables as mentioned in the above link
3. You also needs to install azure-cli on your local system
   ex: for Mac  `brew update && brew install azure-cli` and then login via `az login`

## Final Check 
. Move into the "Test" directory and then test if you can do stuff with terraform , use: 
   1. `tf plan` // This should give you a plan , if a error occurs saying no azure cli then you missed point 3
   2. `tf apply` // This will create the corresponding resource
   3. `tf destroy` // This will destroy the resource, you can use this after point ii

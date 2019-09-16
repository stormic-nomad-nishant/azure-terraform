# Terraform Azure Workshop :fire: 

## Prerequisite
### Install Terraform
1. We will be running this workshop on Macbook 
2. Dowload Terraform binary for your system via https://releases.hashicorp.com/terraform/0.12.8/terraform_0.12.8_darwin_amd64.zip
3. Once the binary is downloaded on your system, unzip it and move the binary to `/usr/local/bin`
4. Move to the root and type `terraform`, the command should be recognized & give you Usage 

### Setup Terraform access to your Azure account
1. Activate your microsolft azure account following the wiki.
2. Login to your Azure account and then click on the `Cloud Shell` icon on the top right side; this will open a mini shell in the browser.
3. On the cloud shell: Click -> Bash & Click -> `Create storage`. This will take a while to create & you will be connected to terminal shortly.
4. On the cloud shell run: `az account list --query "[].{name:name, subscriptionId:id, tenantId:tenantId}"` to get a list of subscription ID and tenant ID values.
5. Copy the value of `subscriptionId` from the above returned json.
6. Next replace the above `subscriptionId` value to the following `az account set --subscription="${subscriptionId}"` & paste in the cloud shell. Hit enter , the command should not result anything in return.
7. Now you can create a service principal for use with Terraform using `az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/${subscriptionId}"` 
8. The above command should return a json with key:value pairs `appId`,`displayName`,`name`,`password` & `tenant` . Copy all the details down. 


### Configure Terraform environment variables 
To configure Terraform to use your Azure AD service principal, set the following environment variables, which are then used by the Azure Terraform modules. 

* ARM_SUBSCRIPTION_ID
* ARM_CLIENT_ID
* ARM_CLIENT_SECRET
* ARM_TENANT_ID
* ARM_ENVIRONMENT

Copy the below & paste in your `.bash_profile` replacing the variables that you noted earlier:

```
#!/bin/sh
echo "Setting environment variables for Terraform"
export ARM_SUBSCRIPTION_ID=your_subscription_id
export ARM_CLIENT_ID=your_appId
export ARM_CLIENT_SECRET=your_password
export ARM_TENANT_ID=your_tenant_id

# Not needed for public, required for usgovernment, german, china
export ARM_ENVIRONMENT=public
```

Do a `source .bash_profile` on terminal

### Install azure-cli on your macbook
1. You also needs to install azure-cli on your local system
   For Mac:  `brew update && brew install azure-cli` 
2. Login from your local terminal to azure via `az login`
3. This will open a browser tab and will return details on to the terminal for subscription. 

## Final Check 
. Move into the "Test" directory and then test if you can do stuff with terraform , use: 
   1. `terraform init` // This should give you the azurerm version & say `Terraform has been successfully initialized!` , if a error occurs saying no azure cli then you missed installing the azure-cli
   2. `terraform plan`// This should give you a plan   
   3. `terraform apply` // This will create the corresponding resource
   4. `terraform destroy` // This will destroy the resource

## Resources 
* https://docs.microsoft.com/en-gb/azure/virtual-machines/linux/terraform-install-configure
* https://www.terraform.io/docs/providers/azurerm/index.html
* https://blog.gruntwork.io/how-to-create-reusable-infrastructure-with-terraform-modules-25526d65f73d
* https://blog.gruntwork.io/a-comprehensive-guide-to-terraform-b3d32832baca


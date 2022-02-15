terraform {
  backend "azurerm" {
    resource_group_name  = "TerraformDemo"
    storage_account_name = "terraformcodeops"
    container_name       = "tfstatefile"
    key                  = "dev.terraform.tfstate"
  }
}
module "RG" {
  source   = "./modules/RG" 
  rgname   = var.rgname     
  location = var.location
}
module "SA" {
  source   = "./modules/StorageAccount"
  sname    = var.sname
  rgname   = var.rgname
  location = var.location
}
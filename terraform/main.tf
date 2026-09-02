module "resource_group"{
    source = "./modules/resource-group"

    resource_group_name = "${var.project_name}-${var.environment}-rg"
    location = var.location
}

module "network" {
  source = "./modules/network"

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  environment         = var.environment
  project_name        = var.project_name
}

module "storage" {
  source = "./modules/storage"
  
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  environment         = var.environment
  project_name        = var.project_name
}
 
module "key_vault" {
  source = "./modules/key-vault"

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  environment         = var.environment
  project_name        = var.project_name
}


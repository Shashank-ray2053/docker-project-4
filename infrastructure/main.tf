module "vpc" {
  source = "./modules/vpc"
  vpc_id = var.vpc_id
}

module "subnets" {
  source = "./modules/subnets"
  vpc_id = module.vpc.vpc_id.id
  public_subnet_1 = var.public_subnet_1
  az_1 = var.az_1
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
  all_traffic = var.all_traffic
}

module "route_table" {
  source = "./modules/route_table"
  vpc_id = module.vpc.vpc_id.id 
}

module "rt_association" {
  source = "./modules/rt_association"
  public_subnet_1 = module.subnets.public_subnet_1
  intern_2_devops_public_route_table = module.route_table.intern_2_devops_route_tables[1]  
}

module "ec2" {
    source = "./modules/ec2"
    ami = var.ami
    instance_type = var.instance_type
    skr_iam_instance_profile_name = module.iam.skr_iam_instance_profile_name
    security_group_id = module.security_group.security_group_id
    public_subnet_1 = module.subnets.public_subnet_1
}


module "iam" {
    source = "./modules/iam"
  
}


module "s3" {
  source = "./modules/s3"
  
}



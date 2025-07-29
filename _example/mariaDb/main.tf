provider "aws" {
  region = "ca-central-1"
}

module "vpc" {
  source      = "git::https://github.com/Shanav-Technologies/terraform-aws-vpc.git?ref=v1.0.0"
  name        = "vpc"
  environment = "test"
  label_order = ["environment", "name"]

  cidr_block = "10.0.0.0/16"
}

module "private_subnets" {
  source      = "git::https://github.com/Shanav-Technologies/terraform-aws-subnet.git?ref=v1.0.0"
  name        = "subnets"
  environment = "test"
  label_order = ["environment", "name"]

  availability_zones = ["ca-central-1a", "ca-central-1b"]
  vpc_id             = module.vpc.id
  type               = "public-private"
  igw_id             = module.vpc.igw_id
  cidr_block         = module.vpc.vpc_cidr_block
  ipv6_cidr_block    = module.vpc.ipv6_cidr_block
}

module "mariadb" {
  source = "../../"

  name              = "mariadb"
  environment       = "test22"
  label_order       = ["environment", "name"]
  engine            = "MariaDB"
  engine_version    = "11.4.5"
  instance_class    = "db.t4g.micro"
  engine_name       = "MariaDB"
  allocated_storage = 16

  db_name  = "test"
  username = "user"
  password = "esfsgcGdfawAhdxtfjm!"
  port     = "3306"

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"
  multi_az           = false

  vpc_id        = module.vpc.id
  allowed_ip    = [module.vpc.vpc_cidr_block]
  allowed_ports = [3306]

  family = "mariadb11.4"

  backup_retention_period = 0

  enabled_cloudwatch_logs_exports = ["audit", "general"]

  subnet_ids          = module.private_subnets.public_subnet_id
  publicly_accessible = true

  major_engine_version = "11.4"

  deletion_protection = true

  ssm_parameter_endpoint_enabled = true
}


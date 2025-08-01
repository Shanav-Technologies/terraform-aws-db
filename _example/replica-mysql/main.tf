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

module "subnets" {
  source      = "git::https://github.com/Shanav-Technologies/terraform-aws-subnet.git?ref=v1.0.0"
  name        = "subnets"
  environment = "test"
  label_order = ["environment", "name"]

  availability_zones = ["ca-central-1a", "ca-central-1b", "ca-central-1d"]
  vpc_id             = module.vpc.id
  type               = "public"
  igw_id             = module.vpc.igw_id
  cidr_block         = module.vpc.vpc_cidr_block
  ipv6_cidr_block    = module.vpc.ipv6_cidr_block
}

module "mysql" {
  source                 = "../../"
  name                   = "rds"
  environment            = "test"
  label_order            = ["environment", "name"]
  enabled                = true
  engine                 = "mysql"
  engine_version         = "8.0.40"
  instance_class         = "db.t4g.micro"
  replica_instance_class = "db.t4g.micro"
  allocated_storage      = 16
  identifier             = ""
  snapshot_identifier    = ""
  kms_key_id             = ""
  enabled_read_replica   = true
  enabled_replica        = true

  db_name  = "replica"
  username = "replica_mysql"
  password = "clkjvnsdikjhdsijfsdli"

  port               = 3306
  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"
  multi_az           = true

  vpc_id        = module.vpc.id
  allowed_ip    = [module.vpc.vpc_cidr_block]
  allowed_ports = [3306]

  backup_retention_period = 1

  enabled_cloudwatch_logs_exports = ["general"]

  subnet_ids          = module.subnets.public_subnet_id
  publicly_accessible = false

  family = "mysql8.0"

  major_engine_version       = "8.0"
  auto_minor_version_upgrade = false

  deletion_protection = true

  ssm_parameter_endpoint_enabled = true
}
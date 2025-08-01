output "master_db_instance_address" {
  description = "The address of the RDS instance"
  value       = module.mysql.db_instance_address
}

output "master_db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = module.mysql.db_instance_arn
}

output "master_db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = module.mysql.db_instance_availability_zone
}

output "master_db_instance_endpoint" {
  description = "The connection endpoint"
  value       = module.mysql.db_instance_endpoint
}

output "master_db_instance_engine" {
  description = "The database engine"
  value       = module.mysql.db_instance_engine
}

output "master_db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = module.mysql.db_instance_hosted_zone_id
}

output "master_db_instance_id" {
  description = "The RDS instance ID"
  value       = module.mysql.db_instance_id
}

output "master_db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = module.mysql.db_instance_resource_id
}

output "master_db_instance_status" {
  description = "The RDS instance status"
  value       = module.mysql.db_instance_status
}

output "master_db_instance_name" {
  description = "The database name"
  value       = module.mysql.db_instance_name
}

output "master_db_instance_username" {
  description = "The master username for the database"
  value       = module.mysql.db_instance_username
  sensitive   = true
}

output "master_db_instance_password" {
  description = "The database password (this password may be old, because Terraform doesn't track it after initial creation)"
  value       = module.mysql.db_instance_password
  sensitive   = true
}

output "master_db_instance_port" {
  description = "The database port"
  value       = module.mysql.db_instance_port
}

output "master_db_subnet_group_id" {
  description = "The db subnet group name"
  value       = module.mysql.db_subnet_group_id
}

output "master_db_instance_cloudwatch_log_groups" {
  description = "Map of CloudWatch log groups created and their attributes"
  value       = module.mysql.db_instance_cloudwatch_log_groups
}

output "replica_db_instance_address" {
  description = "The address of the RDS instance"
  value       = module.mysql.db_instance_address
}

output "replica_db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = module.mysql.db_instance_arn
}

output "replica_db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = module.mysql.db_instance_availability_zone
}

output "replica_db_instance_endpoint" {
  description = "The connection endpoint"
  value       = module.mysql.db_instance_endpoint
}

output "replica_db_instance_engine" {
  description = "The database engine"
  value       = module.mysql.db_instance_engine
}

output "replica_db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = module.mysql.db_instance_hosted_zone_id
}

output "replica_db_instance_id" {
  description = "The RDS instance ID"
  value       = module.mysql.db_instance_id
}

output "replica_db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = module.mysql.db_instance_resource_id
}

output "replica_db_instance_status" {
  description = "The RDS instance status"
  value       = module.mysql.db_instance_status
}

output "replica_db_instance_name" {
  description = "The database name"
  value       = module.mysql.db_instance_name
}

output "replica_db_instance_username" {
  description = "The replica username for the database"
  value       = module.mysql.db_instance_username
  sensitive   = true
}

output "replica_db_instance_port" {
  description = "The database port"
  value       = module.mysql.db_instance_port
}

output "replica_db_instance_cloudwatch_log_groups" {
  description = "Map of CloudWatch log groups created and their attributes"
  value       = module.mysql.db_instance_cloudwatch_log_groups

}

output "kms_key_policy" {
  description = "Policy associated with the KMS key."
  value       = module.mysql.kms_key_policy
}

output "kms_key_rotation_enabled" {
  description = "Indicates whether key rotation is enabled."
  value       = module.mysql.kms_key_rotation_enabled
}

output "kms_key_multi_region" {
  description = "Indicates whether the key is a multi-Region key."
  value       = module.mysql.kms_key_multi_region
}

output "ssm_parameter_name" {
  value       = module.mysql.ssm_parameter_name
  description = "The name of the SSM parameter created."
}

output "ssm_parameter_arn" {
  value       = module.mysql.ssm_parameter_arn
  description = "The ARN of the SSM parameter created."
}

output "ssm_parameter_value" {
  value       = module.mysql.ssm_parameter_value
  description = "The value of the SSM parameter created."
  sensitive   = true # Mark as sensitive to avoid exposing secrets in outputs
}
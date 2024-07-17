output "db_instance_endpoint" {
  value = aws_db_instance.default.endpoint
}

output "db_password_arn" {
  value = aws_secretsmanager_secret.db_password.arn
}
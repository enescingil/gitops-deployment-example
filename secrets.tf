resource "aws_secretsmanager_secret" "db_password" {
  name        = "rds_password"
  description = "This secret contains the RDS database password"

  tags = {
    Name = "RDSPasswordSecret"
  }
}

resource "aws_secretsmanager_secret_version" "db_password" {
  secret_id     = aws_secretsmanager_secret.db_password.id
  secret_string = "your-password" # Replace this with a secure password
}
resource "aws_secretsmanager_secret" "db_password_latest" {
  name        = "rds_password_latest_second"
  description = "This secret contains the RDS database passwords"

  tags = {
    Name = "RDSPasswordSecretLatestSecond"
  }
}

resource "aws_secretsmanager_secret_version" "db_password" {
  secret_id     = aws_secretsmanager_secret.db_password_latest.id
  secret_string = random_password.db_password.result
}
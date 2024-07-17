resource "aws_db_instance" "default" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  db_name                 = "mydb-example"
  username             = "admin"
  password             = aws_secretsmanager_secret_version.db_password.secret_string
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true

  tags = {
    Name = "MyDatabaseInstance"
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "my_database_subnet_group"
  subnet_ids = ["subnet-12345678", "subnet-23456789"] # Replace with your subnet IDs

  tags = {
    Name = "MyDBSubnetGroup"
  }
}
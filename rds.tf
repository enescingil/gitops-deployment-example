resource "aws_db_instance" "dbexample" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  db_name                 = "dbexample"
  username             = "admin"
  password             = aws_secretsmanager_secret_version.db_password.secret_string
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true

  tags = {
    Name = "DatabaseInstance"
  }
}

resource "aws_db_subnet_group" "db-example-subnets" {
  name       = "database_subnet_group"
  subnet_ids = [aws_subnet.public_subnet.id, aws_subnet.private_subnet.id] # Replace with your subnet IDs

  tags = {
    Name = "DBSubnetGroup"
  }
}
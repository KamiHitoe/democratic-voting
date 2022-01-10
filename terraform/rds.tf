resource "aws_db_subnet_group" "weworld-rds-subnet-group" {
  name = "weworld-rds-subnet-group"
  description = "a couple of subnets for RDS that is shared with backend"
  subnet_ids = [aws_subnet.weworld-backend-1a.id, aws_subnet.weworld-backend-1c.id]
}

resource "aws_db_instance" "test-db" {
  identifier             = "test-db"
  instance_class         = "db.t2.micro"
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "12.5"
  username               = var.aws_rds_username
  password               = var.aws_rds_password
  db_subnet_group_name   = aws_db_subnet_group.weworld-rds-subnet-group.name
  vpc_security_group_ids = [aws_security_group.weworld-rds-sg.id]
  # parameter_group_name   = aws_db_parameter_group.education.name
  publicly_accessible    = true
  skip_final_snapshot    = true
  port = 5432
}

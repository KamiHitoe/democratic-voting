# RDS instance
resource "aws_db_instance" "democratic-db" {
  identifier             = "democratic-db"
  instance_class         = "db.t2.micro"
  allocated_storage      = 5 # to 20
  max_allocated_storage = 100
  storage_type = "gp2"
  backup_retention_period = 7
  engine                 = "postgres"
  engine_version         = "12.7"
  username               = var.aws_rds_username
  password               = var.aws_rds_password
  db_subnet_group_name   = aws_db_subnet_group.democratic-rds-subnet-group.name
  vpc_security_group_ids = [aws_security_group.democratic-rds-sg.id]
  # parameter_group_name   = aws_db_parameter_group.education.name
  # publicly_accessible = true # prod => false
  publicly_accessible = false
  skip_final_snapshot = true
  # Postgres Port
  port                = 5432
}

# subnet for RDS
resource "aws_db_subnet_group" "democratic-rds-subnet-group" {
  name        = "democratic-rds-subnet-group"
  description = "a couple of subnets for RDS that is shared with backend"
  subnet_ids  = [aws_subnet.democratic-backend-1a.id, aws_subnet.democratic-backend-1c.id]
}

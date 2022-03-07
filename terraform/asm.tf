
resource "aws_secretsmanager_secret" "postgres_password" {
  name = "postgres_password"
}
resource "aws_secretsmanager_secret_version" "postgres_password" {
  secret_id = aws_secretsmanager_secret.postgres_password.id
  secret_string = var.aws_rds_password
}
resource "aws_secretsmanager_secret_policy" "postgres_password" {
  secret_arn = aws_secretsmanager_secret.postgres_password.arn

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal":"*",
      "Action": "secretsmanager:GetSecretValue",
      "Resource": "*"
    }
  ]
}
POLICY
}

resource "aws_secretsmanager_secret" "secret_key_base" {
  name = "secret_key_base"
}
resource "aws_secretsmanager_secret_version" "secret_key_base" {
  secret_id = aws_secretsmanager_secret.secret_key_base.id
  secret_string = var.secret_key_base
}
resource "aws_secretsmanager_secret_policy" "secret_key_base" {
  secret_arn = aws_secretsmanager_secret.secret_key_base.arn

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal":"*",
      "Action": "secretsmanager:GetSecretValue",
      "Resource": "*"
    }
  ]
}
POLICY
}

# 一度消せば7日間同じ名前のkeyは作れないので注意
# aws secretsmanager delete-secret --secret-id your-secret --force-delete-without-recovery --region your-region

resource "aws_secretsmanager_secret" "pg_password" {
  name = "pg_password"
}
resource "aws_secretsmanager_secret_version" "pg_password" {
  secret_id = aws_secretsmanager_secret.pg_password.id
  secret_string = var.aws_rds_password
}
resource "aws_secretsmanager_secret_policy" "pg_password" {
  secret_arn = aws_secretsmanager_secret.pg_password.arn

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

resource "aws_secretsmanager_secret" "secret_key" {
  name = "secret_key"
}
resource "aws_secretsmanager_secret_version" "secret_key" {
  secret_id = aws_secretsmanager_secret.secret_key.id
  secret_string = var.secret_key_base
}
resource "aws_secretsmanager_secret_policy" "secret_key" {
  secret_arn = aws_secretsmanager_secret.secret_key.arn

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

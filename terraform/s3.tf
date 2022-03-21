resource "aws_s3_bucket" "democratic-image-s3" {
  bucket = "democratic-image-s3"
  # acl    = "public-read"

  tags = {
    Name = "democratic-image-s3"
  }
}

resource "aws_s3_bucket_acl" "democratic-image-s3" {
  bucket = aws_s3_bucket.democratic-image-s3.id
  acl = "public-read"
}

resource "aws_s3_bucket_cors_configuration" "democratic-image-s3" {
  bucket = aws_s3_bucket.democratic-image-s3.bucket

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["HEAD", "GET", "PUT", "POST", "DELETE"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    # max_age_seconds = 3000
  }
}

resource "aws_s3_bucket" "democratic-alblog-s3" {
  bucket = "democratic-alblog-s3"

  # lifecycle_rule {
  #   enabled = true

  #   expiration {
  #     days = "180"
  #   }
  # }

  tags = {
    Name = "democratic-alblog-s3"
  }
}

resource "aws_s3_bucket_policy" "democratic-alblog-s3" {
  bucket = aws_s3_bucket.democratic-alblog-s3.id

  policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Id": "AWSConsole-AccessLogs-Policy-1647840670500",
    "Statement": [
      {
        "Sid": "AWSConsoleStmt-1647840670500",
        "Effect": "Allow",
        "Principal": {
          "AWS": "arn:aws:iam::582318560864:root"
        },
        "Action": "s3:PutObject",
        "Resource": "arn:aws:s3:::democratic-alblog-s3/AWSLogs/716145811673/*"
      },

      {
        "Sid": "AWSLogDeliveryWrite",
        "Effect": "Allow",
        "Principal": {
          "Service": "delivery.logs.amazonaws.com"
        },
        "Action": "s3:PutObject",
        "Resource": "arn:aws:s3:::democratic-alblog-s3/AWSLogs/716145811673/*",
        "Condition": {
          "StringEquals": {
            "s3:x-amz-acl": "bucket-owner-full-control"
          }
        }
      },

      {
          "Sid": "AWSLogDeliveryAclCheck",
          "Effect": "Allow",
          "Principal": {
              "Service": "delivery.logs.amazonaws.com"
          },
          "Action": "s3:GetBucketAcl",
          "Resource": "arn:aws:s3:::democratic-alblog-s3"
      }
    ]
}
  POLICY
}

# resource "aws_s3_bucket" "democratic-image-s3" {
#   bucket = "democratic-image-s3"
#   acl    = "public-read"

#   tags = {
#     Name = "democratic-image-s3"
#   }
# }

resource "aws_s3_bucket" "democratic-alblog-s3" {
  bucket = "democratic-alblog-s3"
  acl = "private"

  policy = <<POLICY
    {
      "Id": "Policy",
      "Version": "2012-10-17",
      "Statement": [
        {
          "Action": [
            "s3:PutObject"
          ],
          "Effect": "Allow",
          "Resource": "arn:aws:s3:::democratic-alblog-s3/AWSLogs/*",
          "Principal": {
            "AWS": [
              "${data.aws_elb_service_account.main.arn}"
            ]
          }
        }
      ]
    }
  POLICY


  lifecycle_rule {
    enabled = true

    expiration {
      days = "180"
    }
  }

  tags = {
    Name = "democratic-alblog-s3"
  }
}

data "aws_elb_service_account" "main" {}

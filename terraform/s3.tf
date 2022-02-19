resource "aws_s3_bucket" "democratic-image-s3" {
  bucket = "democratic-image-s3"
  acl    = "public-read"

  tags = {
    Name = "democratic-image-s3"
  }
}

resource "aws_s3_bucket" "democratic-alblog-s3" {
  bucket = "democratic-alblog-s3"

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
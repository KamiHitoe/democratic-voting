resource "aws_s3_bucket" "democratic-image-s3" {
  bucket = "democratic-image-s3"
  acl    = "public-read"

  tags = {
    Name = "democratic-image-s3"
  }
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
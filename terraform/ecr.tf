resource "aws_ecr_repository" "democratic-frontend" {
  name                 = "democratic-frontend"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
resource "aws_ecr_repository" "democratic-backend" {
  name                 = "democratic-backend"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
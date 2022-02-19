
## DNS
# DNS host zone for frontend
resource "aws_route53_zone" "democratic-frontend-hostzone" {
  name = "test-frontend.com" # have to be changed
  tags = {
    Name = "test-frontend.com"
  }
}
# DNS host zone for backend
resource "aws_route53_zone" "democratic-backend-hostzone" {
  name = "test-backend.com" # have to be changed
  tags = {
    Name = "test-backend.com"
  }
}

# DNS record for frontend
resource "aws_route53_record" "democratic-frontend-record" {
  zone_id = aws_route53_zone.democratic-frontend-hostzone.id
  name = aws_route53_zone.democratic-frontend-hostzone.name
  type = "A"

  # IP addressの代わりにドメイン名の参照先にELBを用いる
  alias {
    name = aws_lb.democratic-frontend-alb.dns_name
    zone_id = aws_lb.democratic-frontend-alb.zone_id
    evaluate_target_health = true
  }
}
# DNS record for backend
resource "aws_route53_record" "democratic-backend-record" {
  zone_id = aws_route53_zone.democratic-backend-hostzone.id
  name = aws_route53_zone.democratic-backend-hostzone.name
  type = "A"

  # IP addressの代わりにドメイン名の参照先にELBを用いる
  alias {
    name = aws_lb.democratic-backend-alb.dns_name
    zone_id = aws_lb.democratic-backend-alb.zone_id
    evaluate_target_health = true
  }
}

## ACM
# SSL certification for frontend
resource "aws_acm_certificate" "democratic-frontend-acm" {
  domain_name = aws_route53_record.democratic-frontend-record.name
  subject_alternative_names = []
  validation_method = "DNS"
  
  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "frontend: test-frontend.com"
  }
}
# SSL certification for backend
resource "aws_acm_certificate" "democratic-backend-acm" {
  domain_name = aws_route53_record.democratic-backend-record.name
  subject_alternative_names = []
  validation_method = "DNS"
  
  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "backend: test-backend.com"
  }
}

# add validation?


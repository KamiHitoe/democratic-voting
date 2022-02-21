
# ALB for frontend
resource "aws_lb" "democratic-frontend-alb" {
  name = "democratic-frontend-alb"
  load_balancer_type = "application"
  internal = false
  idle_timeout = 60
  enable_deletion_protection = false

  subnets = [
    aws_subnet.democratic-frontend-1a.id,
    aws_subnet.democratic-frontend-1c.id,
  ]

  security_groups = [
    aws_security_group.democratic-alb-sg.id,
  ]

  tags = {
    Name = "democratic-frontend-alb"
  }
}

# ALB for backend
resource "aws_lb" "democratic-backend-alb" {
  name = "democratic-backend-alb"
  load_balancer_type = "application"
  internal = false
  idle_timeout = 60
  enable_deletion_protection = false

  subnets = [
    aws_subnet.democratic-backend-1a.id,
    aws_subnet.democratic-backend-1c.id,
  ]

  security_groups = [
    aws_security_group.democratic-alb-sg.id,
  ]

  tags = {
    Name = "democratic-backend-alb"
  }
}

# frontend listener for HTTP
resource "aws_lb_listener" "democratic-frontend-http-listener" {
  load_balancer_arn = aws_lb.democratic-frontend-alb.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port = "443"
      protocol = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}
resource "aws_lb_listener" "democratic-frontend-https-listener" {
  load_balancer_arn = aws_lb.democratic-frontend-alb.arn
  port = "443"
  protocol = "HTTPS"
  # ACM(SSL証明書)の関連付け
  certificate_arn = aws_acm_certificate.democratic-frontend-acm.arn

  default_action {
    target_group_arn = aws_lb_target_group.democratic-frontend-alb-tg.arn
    type = "forward"
  }
}

# backend listener for HTTP
resource "aws_lb_listener" "democratic-backend-http-listener" {
  load_balancer_arn = aws_lb.democratic-backend-alb.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port = "443"
      protocol = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}
resource "aws_lb_listener" "democratic-backend-https-listener" {
  load_balancer_arn = aws_lb.democratic-backend-alb.arn
  port = "443"
  protocol = "HTTPS"
  # ACM(SSL証明書)の関連付け
  certificate_arn = aws_acm_certificate.democratic-backend-acm.arn

  default_action {
    target_group_arn = aws_lb_target_group.democratic-backend-alb-tg.arn
    type = "forward"
  }
}

# target group
resource "aws_lb_target_group" "democratic-frontend-alb-tg" {
  name = "democratic-frontend-alb-tg"
  target_type = "ip"
  vpc_id = aws_vpc.democratic-vpc.id
  port = 80
  protocol = "HTTP"

  health_check {
    enabled             = true
    path                = "/"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout     = 120
    interval        = 150
    matcher        = 200
    port              = 8080
    protocol        = "HTTP"
  }
}

resource "aws_lb_target_group" "democratic-backend-alb-tg" {
  name = "democratic-backend-alb-tg"
  target_type = "ip"
  vpc_id = aws_vpc.democratic-vpc.id
  port = 80
  protocol = "HTTP"

  health_check {
    enabled             = true
    path                = "/v1/health_check"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout     = 120
    interval        = 150
    matcher        = 200
    port              = 3000
    protocol        = "HTTP"
  }
}


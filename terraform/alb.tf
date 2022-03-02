
# ALB
resource "aws_lb" "democratic-alb" {
  name = "democratic-alb"
  load_balancer_type = "application"
  internal = false
  idle_timeout = 300
  enable_deletion_protection = false

  subnets = [
    aws_subnet.democratic-frontend-1a.id,
    aws_subnet.democratic-frontend-1c.id,
  ]

  security_groups = [
    aws_security_group.democratic-alb-sg.id,
  ]

  # access_logs {
  #   bucket = aws_s3_bucket.democratic-alblog-s3.bucket
  #   prefix = "democratic-alb-log"
  #   enabled = true
  # }

  tags = {
    Name = "democratic-alb"
  }
}


# listener for HTTP
resource "aws_lb_listener" "democratic-http-listener" {
  load_balancer_arn = aws_lb.democratic-alb.arn
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
resource "aws_lb_listener" "democratic-https-listener" {
  load_balancer_arn = aws_lb.democratic-alb.arn
  port = "443"
  protocol = "HTTPS"
  # ACM(SSL証明書)の関連付け
  certificate_arn = "arn:aws:acm:ap-northeast-1:716145811673:certificate/ce9779f5-4a3f-47d9-8bf7-217db83aa108"

  default_action {
    target_group_arn = aws_lb_target_group.democratic-frontend-alb-tg.arn
    type = "forward"
  }
}
# path based routing
resource "aws_lb_listener_rule" "api" {
  listener_arn = aws_lb_listener.democratic-https-listener.arn
  priority = 100

  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.democratic-backend-alb-tg.arn
  }

  condition {
    path_pattern {
      values = ["/v1/*"]
    }
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
    port              = 80
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
    path                = "/" # /v1
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout     = 120
    interval        = 150
    matcher        = 200
    port              = 3000
    protocol        = "HTTP"
  }
}



# ALB
resource "aws_lb" "test-alb" {
  name = "test-alb"
  load_balancer_type = "application"
  internal = false
  idle_timeout = 300
  enable_deletion_protection = false

  subnets = [
    "subnet-035c798156b669afb",
    "subnet-0e569b600349b2e96",
  ]

  security_groups = [
    "sg-0dd7ea3f75c49860a",
  ]

  access_logs {
    bucket = aws_s3_bucket.democratic-alblog-s3.bucket
    prefix = "democratic-alb-log"
    enabled = true
  }


  tags = {
    Name = "test-alb"
  }
}

# frontend listener for HTTP
resource "aws_lb_listener" "test-http-listener" {
  load_balancer_arn = aws_lb.test-alb.arn
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
resource "aws_lb_listener" "test-https-listener" {
  load_balancer_arn = aws_lb.test-alb.arn
  port = "443"
  protocol = "HTTPS"
  # ACM(SSL証明書)の関連付け
  certificate_arn = "arn:aws:acm:ap-northeast-1:716145811673:certificate/ce9779f5-4a3f-47d9-8bf7-217db83aa108"

  default_action {
    target_group_arn = aws_lb_target_group.test-alb-tg.arn
    type = "forward"
  }
}

# target group
resource "aws_lb_target_group" "test-alb-tg" {
  name = "test-alb-tg"
  target_type = "ip"
  vpc_id = "vpc-0ed088d3734c925d7"
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



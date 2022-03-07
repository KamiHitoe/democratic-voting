# cluster
resource "aws_ecs_cluster" "democratic-ecs-cluster" {
  name = "democratic-ecs-cluster"
}

data "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"
}
# task definition for frontend
resource "aws_ecs_task_definition" "democratic-frontend-task" {
  family = "democratic-frontend-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  container_definitions    = file("./tasks/frontend.json")
  execution_role_arn       = data.aws_iam_role.ecs_task_execution_role.arn
}
# task definition for backend
resource "aws_ecs_task_definition" "democratic-backend-task" {
  family = "democratic-backend-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  container_definitions    = file("./tasks/backend.json")
  execution_role_arn       = data.aws_iam_role.ecs_task_execution_role.arn
}

# service for frontend
resource "aws_ecs_service" "democratic-frontend-service" {
  name = "democratic-frontend-service"
  cluster = aws_ecs_cluster.democratic-ecs-cluster.id
  task_definition = aws_ecs_task_definition.democratic-frontend-task.arn
  desired_count = 1
  # iam_role = 
  # depends_on = []
  launch_type = "FARGATE"
  platform_version = "1.3.0"
  # unhealty時に自動で再起動させるまでの時間
  health_check_grace_period_seconds = 120

  network_configuration {
    assign_public_ip = true
    security_groups = [
      aws_security_group.democratic-ecs-sg.id
    ]
    subnets = [
      aws_subnet.democratic-frontend-1a.id,
      aws_subnet.democratic-frontend-1c.id,
    ]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.democratic-frontend-alb-tg.arn
    container_name = "democratic-frontend-container"
    container_port = "80"
  }
}
# service for backend
resource "aws_ecs_service" "democratic-backend-service" {
  name = "democratic-backend-service"
  cluster = aws_ecs_cluster.democratic-ecs-cluster.id
  task_definition = aws_ecs_task_definition.democratic-backend-task.arn
  desired_count = 1
  # iam_role = 
  # depends_on = []
  launch_type = "FARGATE"
  platform_version = "1.3.0"
  # unhealty時に自動で再起動させるまでの時間
  health_check_grace_period_seconds = 120

  network_configuration {
    assign_public_ip = true
    security_groups = [
      aws_security_group.democratic-ecs-sg.id
    ]
    subnets = [
      aws_subnet.democratic-backend-1a.id,
      aws_subnet.democratic-backend-1c.id,
    ]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.democratic-backend-alb-tg.arn
    container_name = "democratic-backend-container"
    container_port = "3000"
  }
}





# cluster
resource "aws_ecs_cluster" "test-ecs-cluster" {
  name = "test-ecs-cluster"
}

# task definition for frontend
resource "aws_ecs_task_definition" "test-task" {
  family = "test-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  container_definitions    = file("../tasks/test.json")
  execution_role_arn       = data.aws_iam_role.ecs_task_execution_role.arn
}

data "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"
}

# service for frontend
resource "aws_ecs_service" "test-service" {
  name = "test-service"
  cluster = aws_ecs_cluster.test-ecs-cluster.id
  task_definition = aws_ecs_task_definition.test-task.arn
  desired_count = 1
  # iam_role = 
  # depends_on = []
  launch_type = "FARGATE"
  platform_version = "1.4.0"
  # unhealty時に自動で再起動させるまでの時間
  health_check_grace_period_seconds = 300

  network_configuration {
    assign_public_ip = true
    security_groups = [
      "sg-0921c09d5a763554d"
    ]
    subnets = [
    "subnet-035c798156b669afb",
    "subnet-0e569b600349b2e96",
    ]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.test-alb-tg.arn
    container_name = "test-container"
    container_port = "80"
  }
}



resource "aws_ecs_task_definition" "app" {
  family                   = "app-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "512"  # vertical scaling
  memory                   = "1024"
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.execution_role_arn  # Using same role for simplicity

  container_definitions = jsonencode([
    {
      name      = "app-container"
      image     = var.app_image
      cpu       = 512
      memory    = 1024
      essential = true
      repositoryCredentials = {
        credentialsParameter = "arn:aws:secretsmanager:us-east-1:400493233228:secret:dockerhub-JarXjL"
      }
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
          protocol      = "tcp"
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "app" {
  name            = "app-service"
  cluster         = aws_ecs_cluster.app_cluster.id
  task_definition = aws_ecs_task_definition.app.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  network_configuration {
    subnets         = var.subnet_ids
    security_groups = [var.security_group_id]
    assign_public_ip = true
  }

  depends_on = [aws_ecs_cluster.app_cluster]
}


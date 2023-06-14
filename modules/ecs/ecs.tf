# ----------------------------------------------------------------------------------------------------------------------
# Create ECS Cluster
# ----------------------------------------------------------------------------------------------------------------------
resource "aws_ecs_cluster" "main" {
  name = "test}-cluster-${var.environment}"

  depends_on = [ 
    aws_iam_role_policy_attachment.ecs-task-execution-role-policy-attachment,
    aws_iam_role_policy_attachment.ecs-task-role-policy-attachment
     ]
}

resource "aws_ecs_task_definition" "jobs" {
  for_each = {for a_container in var.containers: a_container.name => a_container}
  family                   = each.value.name
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn
  container_definitions = jsonencode([{
    name        = "${each.value.name}-container-${var.environment}"
    image       = "${each.value.container}:latest"
    essential   = true
    environment = var.environment
    portMappings = [{
        protocol      = each.value.protocol
        containerPort = each.value.container_port
        hostPort      = each.value.host_port
      }]
    }])

  depends_on = [ aws_ecs_cluster.main ]
}


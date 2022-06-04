#------------------------------
# Task Definition               
#------------------------------


resource "aws_ecs_task_definition" "fx" {
  for_each                 = var.users
  family                   = "${each.key}-FX"
  task_role_arn            = data.terraform_remote_state.iam.outputs.ecs_task_role_arn
  execution_role_arn       = data.terraform_remote_state.iam.outputs.ecs_task_execution_role_arn
  network_mode             = "awsvpc"
  cpu                      = "1024"
  memory                   = "2048"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = <<DEFINITION
  [
      {
        "logConfiguration": {
          "logDriver": "awslogs",
          "options": {
            "awslogs-group": "/ecs/forex",
            "awslogs-region": "${var.region}",
            "awslogs-stream-prefix": "ecs",
            "awslogs-create-group": "true"
          }
        },
        "portMappings": [
          {
            "hostPort": 80,
            "protocol": "tcp",
            "containerPort": 80
          }
        ],
        "cpu": 0,
        "environment": [],
        "image": "444395806902.dkr.ecr.us-east-1.amazonaws.com/fx-reverse-proxy:ecs",
        "dependsOn": [
          {
            "containerName": "app",
            "condition": "START"
          }
        ],
        "name": "reverse-proxy"
      },
      {
        "logConfiguration": {
          "logDriver": "awslogs",
          "options": {
            "awslogs-group": "/ecs/forex",
            "awslogs-region": "${var.region}",
            "awslogs-stream-prefix": "ecs",
            "awslogs-create-group": "true"
          }
        },
        "cpu": 0,
        "environment": [
          {
            "name": "FX_ENV",
            "value": "${upper(var.common_tags["Environment"])}"
          }
        ],
        "image": "444395806902.dkr.ecr.us-east-1.amazonaws.com/fx-app:latest",
        "name": "app"
      }
  ]
  DEFINITION

}

#-------------------------------------
# SNS Subscriptions
#-------------------------------------

resource "aws_sns_topic" "fx_orders" {
  for_each = var.users
  name     = "fx-orders-${each.key}"
}

resource "aws_sns_topic_subscription" "fx_orders" {
  for_each  = var.users
  topic_arn = aws_sns_topic.fx_orders[each.key].arn
  protocol  = "email"
  endpoint  = each.value
}
# ----------------------------------------------------------------------------------------------------------------------
# CREATE Security Group for http/https and egress
# ----------------------------------------------------------------------------------------------------------------------
resource "aws_security_group" "alb" {
  name   = "test-sg-alb-${var.environment}"
  vpc_id = aws_vpc.main.id
 
  ingress {
   protocol         = "tcp"
   from_port        = 80
   to_port          = 80
   cidr_blocks      = ["0.0.0.0/0"]
   ipv6_cidr_blocks = ["::/0"]
  }
 
  ingress {
   protocol         = "tcp"
   from_port        = 443
   to_port          = 443
   cidr_blocks      = ["0.0.0.0/0"]
   ipv6_cidr_blocks = ["::/0"]
  }
 
  egress {
   protocol         = "-1"
   from_port        = 0
   to_port          = 0
   cidr_blocks      = ["0.0.0.0/0"]
   ipv6_cidr_blocks = ["::/0"]
  }

  depends_on = [ aws_vpc.main ]
}

### Containner ports
resource "aws_security_group" "ecs_tasks" {
  name   = "docker-sg-task-${var.environment}"
  vpc_id = aws_vpc.main.id
 
  ingress {
   protocol         = "tcp"
   from_port        = 8080
   to_port          = 80
   cidr_blocks      = ["0.0.0.0/0"]
   ipv6_cidr_blocks = ["::/0"]
  }
 
  egress {
   protocol         = "-1"
   from_port        = 0
   to_port          = 0
   cidr_blocks      = ["0.0.0.0/0"]
   ipv6_cidr_blocks = ["::/0"]
  }

  depends_on = [ aws_vpc.main ]
}
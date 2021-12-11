resource "aws_lb_target_group" "targetgrp1" {
  name     = "targetgrp1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpcInfo

  health_check {
      
      protocol = "HTTP"
      path = "/"
      matcher = 200

  }
}


resource "aws_lb_target_group" "targetgrp2" {
  name     = "targetgrp2"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpcInfo

  health_check {
      
      protocol = "HTTP"
      path = "/"
      matcher = 200

  }
}


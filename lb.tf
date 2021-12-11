module "vpc" {

  source = "git::https://github.com/BetcyBabu/Terraform-VPC-module.git"
  project = var.project
  cidr_block =var.cidr_block
}

resource "aws_lb" "lb" {
  name               = "${var.project}-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb-secgrp.id]
  subnets            = [ for subnet in "${module.vpc.subnetsPub}" : subnet]

  tags = {
    Environment = "production"
  }
}




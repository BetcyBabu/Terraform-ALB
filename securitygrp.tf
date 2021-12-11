resource "aws_security_group" "lb-secgrp" {
  name        = "lb-secgrp"
  description = "Allow 80,443,22"
  vpc_id      = module.vpc.vpcInfo

  ingress = [ {
    description      = ""
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    security_groups   = []
    prefix_list_ids = []
    self = false
    
  },

   {
    description      = ""
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    security_groups   = []
    prefix_list_ids = []
    self = false
  },


  {
    description      = ""
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = []
    security_groups   = []
    prefix_list_ids = []
    self = false
  }

  ]

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "lb-secgrp"
  }
}
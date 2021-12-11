
resource "aws_launch_configuration" "launchconf01" {
  name          = "launchconf01"
  image_id      = "ami-052cef05d01020f1d"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.lb-secgrp.id]
  user_data = file("userdata.sh")

  lifecycle {
    create_before_destroy = true
  }
}



resource "aws_launch_configuration" "launchconf02" {
  name          = "launchconf02"
  image_id      = "ami-052cef05d01020f1d"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.lb-secgrp.id]
  user_data = file("userdata.sh")
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_attachment" "asg_attachment01" {
  autoscaling_group_name = aws_autoscaling_group.ASG01.id
  alb_target_group_arn   = aws_lb_target_group.targetgrp1.arn
}

resource "aws_autoscaling_attachment" "asg_attachment02" {
  autoscaling_group_name = aws_autoscaling_group.ASG02.id
  alb_target_group_arn   = aws_lb_target_group.targetgrp2.arn
}
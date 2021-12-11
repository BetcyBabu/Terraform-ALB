resource "aws_autoscaling_group" "ASG01" {
  name                      = "ASG01"
  max_size                  = var.asg-num
  min_size                  = var.asg-num
  desired_capacity          = var.asg-num
  launch_configuration      = aws_launch_configuration.launchconf01.name
  vpc_zone_identifier       = [for subnet in "${module.vpc.subnetsPub}" : subnet] 
  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_autoscaling_group" "ASG02" {
  name                      = "ASG02"
  max_size                  = var.asg-num
  min_size                  = var.asg-num
  desired_capacity          = var.asg-num
  launch_configuration      = aws_launch_configuration.launchconf02.name
  vpc_zone_identifier       = [for subnet in "${module.vpc.subnetsPub}" : subnet] 
  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_lb_listener" "fixed" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Default Page"
      status_code  = "200"
    }
  }

    depends_on = [ aws_lb.lb ]
}

resource "aws_lb_listener_rule" "redirection-rule01" {
  listener_arn = aws_lb_listener.fixed.arn


  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.targetgrp1.arn
  }

  condition {
    host_header {
      values = ["website01.com"]
    }
  }
}

resource "aws_lb_listener_rule" "redirection-rule02" {
  listener_arn = aws_lb_listener.fixed.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.targetgrp2.arn
  }

  condition {
    host_header {
      values = ["website02.com"]
    }
  }
}


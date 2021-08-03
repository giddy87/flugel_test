resource "aws_lb_listener" "flugel_alb_listener" {
  load_balancer_arn = aws_lb.flugel_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.flugel.arn
  }
}

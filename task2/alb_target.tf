
# ALB Target Group
resource "aws_lb_target_group" "flugel" {
  name     = "flugel-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.flugel.id
}


# ALB Target Attachment
resource "aws_lb_target_group_attachment" "flugel_tga" {
  target_group_arn = aws_lb_target_group.flugel.arn
#  target_id        = aws_instance.flugel_web.id
#inst_id = aws_instance.flugel_web[range(0,var.instance_count)].id
#for_each = {
#    for inst_id in aws_instance.flugel_web.id : count.index => index
#  }

#  target_id        = {for i in aws_instance.flugel_web[0].id : i => 0
#                      if i < var.instance_count }
#  target_id = aws_instance.flugel_web[var.instance_count].id
count = var.instance_count
target_id         = "${element(split(",", join(",", aws_instance.flugel_web.*.id)), count.index)}"

  port             = 80
}

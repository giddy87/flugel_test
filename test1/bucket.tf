resource "aws_s3_bucket" "s3" {
  bucket = "flugel_test_bucket"
  acl    = "private"

  tags = {
    Name        = "Flugel"
    Owner = "InfraTeam"
  }
}

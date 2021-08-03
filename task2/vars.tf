variable "AWS_REGION" {
default = "us-east-2"
}

variable "PATH_TO_PUBLIC_KEY" {
default = "flugel.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
default = "mykey"
}

variable "instance_count" {
default = "2"
}

variable "instance_type" {
default = "t2.micro"
}

variable "ami" {
default = ""
}

variable "az_a"{
default= "us-east-2a"
}

variable "az_b" {
default = "us-east-2b"
}

variable "tags" {
  description = "Tags to add to resources"
  type        = map(string)
  default = {
    Name = "Flugel"
    Owner = "InfraTeam"
  }
}

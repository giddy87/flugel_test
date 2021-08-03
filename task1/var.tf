variable "PATH_TO_PUBLIC_KEY" {
default = "flugel.pub"
}

variable "instance_type"{
default = "t2.micro"
}
 variable "ami" {
default = "ami-09862fadec6997084"
}

variable "tags" {
  description = "Tags to add to resources"
  type        = map(string)
  default = {
    Name = "Flugel"
    Owner = "InfraTeam"
  }
}


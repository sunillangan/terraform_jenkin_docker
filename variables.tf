variable "key_pair" {
  default = "terraform-key"
}

variable "iam_user" {
  default = "ubuntu"
}

variable "security_group" {
  default = "sunil-security_group"
}

variable "sg_ingress_ports" {
  type = list(number)
  description = "list of ingress ports"
  default = [22,80,443,8080]
}

variable "sg_egress_ports" {
  type = list(number)
  description = "list of egress ports"
  default = [0]
}

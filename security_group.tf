resource "aws_security_group" "sg" {
  name=var.security_group
  description = "Allow TLS inbound traffic"

  dynamic "ingress" {
    for_each = var.sg_ingress_ports
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }
  
     dynamic "egress" {
      for_each = var.sg_egress_ports
      iterator = sg_e_port
      content {
        from_port = sg_e_port.value
        to_port = sg_e_port.value
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
         ipv6_cidr_blocks = ["::/0"]
      }
  }

    tags = {
    Name = "allow_multi_port"
  }
}
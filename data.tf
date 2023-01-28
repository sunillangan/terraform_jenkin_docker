data "aws_ami" "appami" {
  most_recent = true
  owners      = ["amazon"]

 /* filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }*/

// 20.04 ami-0778521d914d23bc1
//22.04 ami-01625be155ee390e9
// ami-00874d747dde814fa - 22.04 x86_64
  filter {
    name   = "name"
    values = ["ubuntu*22.04*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

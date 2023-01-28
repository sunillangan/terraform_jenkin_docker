resource "aws_instance" "myec2_jenkins" {
  ami = data.aws_ami.appami.id

  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name        = var.key_pair
  iam_instance_profile  = aws_iam_instance_profile.ec2_profile.name
  
 root_block_device {
    volume_size = 20 # in GB <<----- I increased this!
    volume_type = "gp2"
  }


  provisioner "remote-exec"  {
    inline  = [


    file("jenkins.sh"),
    file("docker.sh")

    ]
   }
 connection {
    type         = "ssh"
    host         = self.public_ip
    user         = var.iam_user
    private_key  = file("D:\\Software\\Putty\\terraform-key.pem")
   }

  tags  = {
    "Name"      = "Jenkins"
      }
}

resource "aws_instance" "myec2_app_server" {
  ami = data.aws_ami.appami.id

  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name        = var.key_pair
  iam_instance_profile  = aws_iam_instance_profile.ec2_profile.name
  
 root_block_device {
    volume_size = 20 # in GB <<----- I increased this!
    volume_type = "gp2"
  }


  provisioner "remote-exec"  {
    inline  = [

   file("docker.sh")

      ]
   }
 connection {
    type         = "ssh"
    host         = self.public_ip
    user         = var.iam_user
    private_key  = file("D:\\Software\\Putty\\terraform-key.pem")
   }

  tags  = {
    "Name"      = "Appserver"
      }
}
resource "aws_instance" "terra-test"{
	ami=data.aws_ami.ubuntu.id
	instance_type="t2.micro"
	key_name="bobs"
	security_groups = [aws_security_group.web_traffic.name]

	connection {
		type        = "ssh"
		host        = self.public_ip
		user        = "ubuntu"
		private_key = file("~/.ssh/bobs.pem")
	}  

	provisioner "remote-exec" {
		inline = [
			 "sudo apt-get update",
			 "sudo apt install neofetch"
		]
	}
	tags={
		Name="Test Terraform"
		Terraform = "true"
		Environment="TEST"
	}
}

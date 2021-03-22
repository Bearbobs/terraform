resource "aws_instance" "terra-test"{
	ami="ami-0d758c1134823146a"
	instance_type="t2.micro"
	key_name="bobs"
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
		Environment="TEST"
	}
}

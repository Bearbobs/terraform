resource "aws_instance" "terra-test"{
	ami="ami-0d758c1134823146a"
	instance_type="t2.micro"
	key_name="bobs"
	connection {
		user="ubuntu"
		key_file="ssh/key"
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

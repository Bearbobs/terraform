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
			 "sudo apt update",
			 "sudo apt update",
			 "sudo apt-get install -y software-properties-common",
			 "sudo apt-get install -y awscli",
			 "aws configure set aws_access_key_id ${var.access_key}",
			 "aws configure set aws_secret_access_key ${var.secret_key}",
			 "aws configure set default_region_name ap-south-1",
			 "echo 'test'"
		]
	}
	tags={
		Name="Test Terraform"
		Terraform = "true"
		Environment="TEST"
	}
}

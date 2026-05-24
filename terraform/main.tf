resource "aws_security_group" "app_sg" {
	name = "node-app-sg"
	
	ingress {
		from_port  = 22
		to_port    = 22
		protocol   = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	
	}
	
	ingress {
		from_port = 3000
		to_port   = 3000
		protocol  = "tcp"
		cidr_blocks = ["0.0.0.0/0"]

	}
	
	egress {
		from_port  = 0
		to_port	   = 0
		protocol   = "-1"
   		cidr_blocks = ["0.0.0.0/0"] 
	}
}

resource "aws_key_pair" "deployer"{
	key_name  = "github-action-key"
	public_key = file("~/.ssh/id_rsa.pub")

}

resource "aws_instance" "app_server" {
	#ami		= "ami-0236922087fa98b6e" # amazon
	ami		= "ami-091138d0f0d41ff90" # ubuntu
	instance_type	= "t2.micro"

	key_name	= aws_key_pair.deployer.key_name
	vpc_security_group_ids = [
		aws_security_group.app_sg.id
	]
	tags = {
		Name = "github_action_server"
	}

	user_data = <<-EOF
		    #!/bin/bash
		    apt update -y
 		    apt install -y nodejs npm git
		    npm install -g pm2
		    EOF
}




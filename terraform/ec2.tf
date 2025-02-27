resource "aws_security_group" "Jenkins-sg" {
  name = "Jekins security group"
  ingress = [
    for port in [22, 80, 443, 8080] : {
      description      = "TLS from VPC"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false

    }
  ]
  egress = {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Jenkins-sg"
  }
}
resource "aws_instance" "jenkins-server" {

  ami             = "ami-0f5ee92e2d63afc18"
  instance_type   = "t2.medium"
  key_name        = "Mumbai"
  security_groups = [aws_security_group.Jenkins-sg.name]
  user_data       = file("./install_jenkins.sh")

  tags = {
    Name = "Jenkins-sonar"
  }
  root_block_device {
    volume_size = 8
  }

}

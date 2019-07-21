resource "aws_security_group" "example-instance" {
  vpc_id = "${aws_vpc.main.id}"
  name = "allow-ssh"
  description = "security group that allows ssh and all egress traffic"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
tags = {
    Name = "example-instance"
  }
}

resource "aws_security_group" "allow-mysqldb" {
  vpc_id = "${aws_vpc.main.id}"
  name = "allow-mysqldb"
  description = "allow-mysqldb"
  ingress {
      from_port = 3306
      to_port = 3306
      protocol = "tcp"
      security_groups = ["${aws_security_group.example-instance.id}"]              # allowing access from our example instance
  
}
 ingress {
      from_port = 5432
      to_port = 5432
      protocol = "tcp"
      security_groups = ["${aws_security_group.example-instance.id}"]              # allowing access from our example instance
  }
 
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      self = true
  }
  tags = {
    Name = "allow-mysqldb"
  }
}


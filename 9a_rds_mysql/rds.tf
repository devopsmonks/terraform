resource "aws_db_subnet_group" "mysqldb-subnet" {
    name = "mysqldb-subnet"
    description = "RDS subnet group"
    subnet_ids = ["${aws_subnet.main-private-1.id}","${aws_subnet.main-private-2.id}"]
}

resource "aws_db_parameter_group" "mysqldb-parameters" {
    name = "mysqldb-parameters"
    family = "mysql5.7"
    description = "mysqldb parameter group"

    parameter {
      name = "character_set_server"
      value = "utf8"
   }

    parameter {
      name = "character_set_client"
      value = "utf8"
   }
}


resource "aws_db_instance" "mysqldb" {
  allocated_storage    = 20    # 100 GB of storage, gives us more IOPS than a lower number
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"    # use micro if you want to use the free tier
  identifier           = "mysqldb"
  name                 = "mysqldb"
  username             = "chakra"   # username
  password             = "${var.RDS_PASSWORD}" # password
  db_subnet_group_name = "${aws_db_subnet_group.mysqldb-subnet.name}"
  parameter_group_name = "${aws_db_parameter_group.mysqldb-parameters.name}"
  multi_az             = "false"     # set to true to have high availability: 2 instances synchronized with each other
  vpc_security_group_ids = ["${aws_security_group.allow-mysqldb.id}"]
  storage_type         = "gp2"
  backup_retention_period = 30    # how long you’re going to keep your backups
  availability_zone = "${aws_subnet.main-private-1.availability_zone}"   # prefered AZ
  skip_final_snapshot = true   # skip final snapshot when doing terraform destroy
  #parameter_group_name = "${aws_db_parameter_group}"
  tags = {
      Name = "mysqldb-instance"
  }
}

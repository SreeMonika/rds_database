resource "aws_db_instance" "mysql_db" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  db_name               = "database_name"
  username             = "admin_db"
  password             = "rdsdatabase123"
  skip_final_snapshot  =  true
  db_subnet_group_name = aws_db_subnet_group.mysql_db_subnet_grp.name
  vpc_security_group_ids = [aws_security_group.mysql_server.id]
  multi_az = true
}

resource "aws_db_subnet_group" "mysql_db_subnet_grp" {
  name       = "mysql-db-grp"
  subnet_ids = [
    data.aws_subnet.data-a.id,
    data.aws_subnet.data-b.id
  ]


  tags = {
    Name = "demo mysql"
  }
}




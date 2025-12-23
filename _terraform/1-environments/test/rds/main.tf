## This file and its content are generated based on config, pleas check README.md for more details

module "this" {
  source  = "dasmeta/rds/aws"
  version = "1.4.0"

  allocated_storage = 20
  backup_retention_period = 7
  db_name = "testdb"
  db_password = "Test1234!"
  db_username = "admin"
  engine = "mysql"
  engine_version = "8.0"
  identifier = "rds-instance"
  instance_class = "db.t2.micro"
  multi_az = false
  port = 3306
  publicly_accessible = false
  storage_encrypted = true
  storage_type = "gp2"
  subnet_ids = ["${data.tfe_outputs.this["1-environments/test/vpc"].values.results.private_subnets}"]
  tags = {"Environment":"test","Owner":"mher-test","Project":"Test-Infra-HCL"}
  vpc_security_group_ids = ["${data.tfe_outputs.this["1-environments/test/rds-sg"].values.results.rds_security_group_id}"]
  providers = {"aws":"aws"}
}


data "tfe_outputs" "this" {
  for_each = { for workspace in ["1-environments/test/vpc","1-environments/test/rds-sg"] : workspace => workspace }

  organization = "mher-test"
  workspace    = replace(each.value, "/[^a-zA-Z0-9_-]+/", "_")
}

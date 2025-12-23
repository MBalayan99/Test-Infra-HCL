## This file and its content are generated based on config, pleas check README.md for more details

module "this" {
  source  = "dasmeta/rds/aws"
  version = "1.4.0"

  alarms = [{"comparison_operator":"GreaterThanThreshold","enabled":true,"evaluation_periods":1,"name":"cpu_utilization_high","period":300,"sns_topic":"Default","statistic":"Average","threshold":80}]
  allocated_storage = 20
  backup_retention_period = 7
  create_security_group = true
  db_name = "testdb"
  db_password = "Test1234!"
  db_username = "admin"
  engine = "mysql"
  engine_version = "8.0"
  identifier = "rds-instance"
  ingress_with_cidr_blocks = [{"cidr_blocks":["10.16.0.0/16"],"from_port":3306,"protocol":"tcp","to_port":3306}]
  instance_class = "db.t2.micro"
  multi_az = false
  port = 3306
  publicly_accessible = false
  security_group_description = "Security group for RDS instance"
  security_group_name = "rds-instance-sg"
  storage_encrypted = true
  storage_type = "gp2"
  subnet_ids = "${data.tfe_outputs.this["1-environments/test/vpc"].values.results.private_subnets}"
  tags = {"Environment":"test","Owner":"mher-test","Project":"Test-Infra-HCL"}
  providers = {"aws":"aws"}
}


data "tfe_outputs" "this" {
  for_each = { for workspace in ["1-environments/test/vpc"] : workspace => workspace }

  organization = "mher-test"
  workspace    = replace(each.value, "/[^a-zA-Z0-9_-]+/", "_")
}

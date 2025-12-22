## This file and its content are generated based on config, pleas check README.md for more details

module "this" {
  source  = "dasmeta/security-group/aws"
  version = "1.0.0"

  description = "Security group for RDS MySQL"
  egress_with_cidr_blocks = [{"cidr_blocks":["0.0.0.0/0"],"from_port":0,"protocol":"-1","to_port":0}]
  ingress_with_cidr_blocks = [{"cidr_blocks":["10.16.0.0/16"],"from_port":3306,"protocol":"tcp","to_port":3306}]
  name = "rds-mysql-sg"
  tags = {"Environment":"test","Name":"rds-mysql-sg"}
  vpc_id = "${linked_workspaces.vpc.outputs.vpc_id}"
  providers = {"aws":"aws"}
}


data "tfe_outputs" "this" {
  for_each = { for workspace in ["1-environments/test/vpc"] : workspace => workspace }

  organization = "mher-test"
  workspace    = replace(each.value, "/[^a-zA-Z0-9_-]+/", "_")
}

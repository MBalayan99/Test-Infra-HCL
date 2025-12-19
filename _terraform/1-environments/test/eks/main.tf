## This file and its content are generated based on config, pleas check README.md for more details

module "this" {
  source  = "dasmeta/eks/aws"
  version = "2.24.6"

  account_id = "718484331636"
  alarms = {"sns_topic":"Default"}
  cluster_name = "eks-dev"
  map_users = [{"groups":["system:masters"],"rolearn":"arn:aws:iam::718484331636:role/login-aws-check-role","username":"AWSReservedSSO_AdministratorAccess_9f6025a800250f00"}]
  providers = {"aws":"aws"}
}


data "tfe_outputs" "this" {
  for_each = { for workspace in ["1-environments/test/vpc"] : workspace => workspace }

  organization = "mher-test"
  workspace    = replace(each.value, "/[^a-zA-Z0-9_-]+/", "_")
}

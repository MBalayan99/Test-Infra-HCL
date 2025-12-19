## This file and its content are generated based on config, pleas check README.md for more details

module "this" {
  source  = "dasmeta/eks/aws"
  version = "2.24.6"

  account_id = "718484331636"
  alarms = {"sns_topic":"Default"}
  cluster_enabled_log_types = []
  cluster_name = "eks-dev"
  enable_kube_state_metrics = true
  karpenter = {"configs":{"replicas":1},"enabled":true}
  keda = {"attach_policies":{"sqs":true},"enabled":false}
  map_users = [{"groups":["system:masters"],"rolearn":"arn:aws:iam::718484331636:role/login-aws-check-role","username":"AWSReservedSSO_AdministratorAccess_9f6025a800250f00"}]
  node_groups = {"dev_nodes_ondemand":{"ami_type":"AL2023_x86_64_STANDARD","block_device_mappings":{"xvda":{"device_name":"/dev/xvda","ebs":{"volume_size":100,"volume_type":"gp3"}}},"capacity_type":"ON_DEMAND","desired_size":1,"instance_types":["t2.micro"],"max_capacity":1,"max_size":1,"min_size":1},"node_groups_default":{"ami_type":"AL2023_x86_64_STANDARD","capacity_type":"SPOT","disk_size":50,"instance_types":["t2.micro"]}}
  prometheus_metrics = ["kube_node_status_condition"]
  resource_configs = {"nodePools":{"general":{"weight":1}}}
  resource_configs_defaults = {"limits":{"cpu":100}}
  s3_csi = {"enabled":false}
  vpc = {"link":{"id":"${data.tfe_outputs.this["1-environments/test/vpc"].values.results.id}","private_subnet_ids":"${data.tfe_outputs.this["1-environments/test/vpc"].values.results.private_subnets}"}}
  providers = {"aws":"aws"}
}


data "tfe_outputs" "this" {
  for_each = { for workspace in ["1-environments/test/vpc"] : workspace => workspace }

  organization = "mher-test"
  workspace    = replace(each.value, "/[^a-zA-Z0-9_-]+/", "_")
}

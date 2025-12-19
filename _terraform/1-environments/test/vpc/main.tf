## This file and its content are generated based on config, pleas check README.md for more details

module "this" {
  source  = "dasmeta/vpc/aws"
  version = "1.0.2"

  availabilyty_zones = "-\"ey-central-1a\" -\"ey-central-1b\" -\"ey-central-1c\""
  cidr = "10.16.0.0/24"
  names = "test-vpc"
  private_subnets = "-\"10.16.1.0/24\" -\"10.16.2.0/24\" -\"10.16.3.0/24\""
  private_subnets_tags = {"kubernetes.io/cluster/eks-dev":"shared\"","kubernetes.io/role/internal-elb":"1","kubernetes.sh/discovery":"eks-dev"}
  public_subnets = "-\"10.16.4.0/24\" -\"10.16.5.0/24\" -\"10.16.6.0/24\""
  public_subnets_tags = {"kubernetes.io/cluster/eks-dev":"shared\"","kubernetes.io/role/internal-elb":"1","kubernetes.sh/discovery":"eks-dev"}
  providers = {"aws":"aws"}
}


data "tfe_outputs" "this" {
  for_each = { for workspace in [] : workspace => workspace }

  organization = "mher-test"
  workspace    = replace(each.value, "/[^a-zA-Z0-9_-]+/", "_")
}

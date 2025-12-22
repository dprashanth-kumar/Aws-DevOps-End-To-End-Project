provider "aws" {
  region = var.region
}
module "eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"
  cluster_name     = var.cluster_name
  cluster_version  = "1.29"

  vpc_id     = null
  subnet_ids = []

  eks_managed_node_groups  = {
    free_tier  = {
      instance_types  = ["t3.micro"]
      desired_size    = 1
      min_size        = 1
      max_size        = 1
    }
  }
}

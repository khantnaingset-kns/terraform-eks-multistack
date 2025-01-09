module "iam" {
  source = "./modules/iam/"

  eks_cluster_name            = var.eks_cluster_name
  eks_cluster_role_policy_arn = var.eks_cluster_role_policy_arn
  eks_node_role_policy_arns   = var.eks_node_role_policy_arns
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
}

module "eks" {
  source = "./modules/eks/"

  cluster_name     = var.eks_cluster_name
  cluster_role_arn = module.iam.eks_cluster_role_arn

  subnet_ids = flatten([module.vpc.private_subnets, module.vpc.public_subnets])
  vpc_id     = module.vpc.default_vpc_id

  node_group_name = var.node_group_name
  node_role_arn   = module.iam.eks_node_role_arn

  node_subnet_ids = module.vpc.private_subnets

  eks_admin_user_arn = var.eks_admin_user_arn
}

module "platform" {
  source = "./modules/platform/"

  depends_on = [module.eks]
}

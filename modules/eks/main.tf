resource "aws_eks_cluster" "this" {
  name = var.cluster_name

  access_config {
    authentication_mode = "API"
  }

  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }

}

resource "aws_eks_node_group" "this" {
  cluster_name    = var.cluster_name
  node_group_name = var.node_group_name
  node_role_arn   = var.node_role_arn

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  capacity_type = "ON_DEMAND"

  ami_type = "AL2_x86_64"

  subnet_ids = var.node_subnet_ids

  instance_types = ["t3.medium"]

  update_config {
    max_unavailable = 1
  }

  depends_on = [aws_eks_cluster.this]
}

resource "aws_eks_access_entry" "admin_user" {
  cluster_name  = var.cluster_name
  principal_arn = var.eks_admin_user_arn
  type          = "STANDARD"

  depends_on = [aws_eks_cluster.this]
}

resource "aws_eks_access_policy_association" "admin_user_policy" {
  cluster_name  = var.cluster_name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  principal_arn = var.eks_admin_user_arn

  access_scope {
    type = "cluster"
  }

  depends_on = [aws_eks_access_entry.admin_user]

}

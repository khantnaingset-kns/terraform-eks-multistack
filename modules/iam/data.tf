data "aws_iam_policy" "eks_cluster_role_policy" {
  arn = var.eks_cluster_role_policy_arn
}

data "aws_iam_policy" "eks_node_role_policies" {
  for_each = var.eks_node_role_policy_arns
  arn      = each.value
}
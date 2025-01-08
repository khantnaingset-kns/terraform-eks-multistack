output "eks_cluster_role_arn" {
  value       = aws_iam_role.eks_cluster_role.arn
  description = "Value of the ARN of the IAM role that allows the EKS cluster to access other AWS services"
}

output "eks_node_role_arn" {
  value = aws_iam_role.eks_node_role.arn
}
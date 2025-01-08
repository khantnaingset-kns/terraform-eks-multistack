variable "eks_cluster_role_policy_arn" {
  type        = string
  description = "The ARN of the IAM policy that allows the EKS cluster to access other AWS services"
}

variable "eks_cluster_name" {
  type        = string
  description = "The name of the EKS cluster"
}

variable "eks_node_role_policy_arns" {
  type        = set(string)
  description = "The ARNs of the IAM policies that allow the EKS nodes to access other AWS services"
}
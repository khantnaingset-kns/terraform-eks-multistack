variable "environment" {
  description = "The environment in which the resources are deployed"
  type        = string
}

variable "eks_cluster_role_policy_arn" {
  type        = string
  description = "The ARN of the IAM policy that allows the EKS cluster to access other AWS services"
}

variable "eks_cluster_role_name" {
  type        = string
  description = "The name of the IAM role that allows the EKS cluster to access other AWS services"
}

variable "eks_cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}

variable "vpc_cidr" {
  type        = string
  description = "Value of the CIDR block for the VPC"
}

variable "eks_node_role_policy_arns" {
  type        = set(string)
  description = "The ARNs of the IAM policies that allow the EKS nodes to access other AWS services"
}

variable "node_group_name" {
  type        = string
  description = "The name of the EKS node group"
}

variable "eks_admin_user_arn" {
  type        = string
  description = "The ARN of the IAM user that will have admin access to the EKS cluster"
}

variable "repo_ssh_private_key_path" {
  description = "Path for SSH private key for the repository"
  type        = string
  sensitive   = true
}
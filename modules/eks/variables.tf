variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "cluster_role_arn" {
  type        = string
  description = "The ARN of the IAM role that allows the EKS cluster to access other AWS services"
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC where the EKS cluster will be deployed"
}

variable "subnet_ids" {
  type        = list(string)
  description = "A list of subnet IDs for the EKS cluster"
}

variable "node_group_name" {
  type        = string
  description = "The name of the EKS node group"
}

variable "node_role_arn" {
  type        = string
  description = "The ARN of the IAM role that allows the EKS nodes to access other AWS services"
}

variable "node_subnet_ids" {
  type        = list(string)
  description = "A list of subnet IDs for the EKS node group"
}

variable "eks_admin_user_arn" {
  type        = string
  description = "The ARN of the IAM user that will have admin access to the EKS cluster"
}


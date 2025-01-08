output "cluster_arn" {
  value       = aws_eks_cluster.this.arn
  description = "The Amazon Resource Name (ARN) of the EKS cluster"
}

output "eks_host" {
  value       = aws_eks_cluster.this.endpoint
  description = "The endpoint for the EKS cluster"
}

output "cluster_ca_certificate" {
  value       = base64decode(aws_eks_cluster.this.certificate_authority[0].data)
  description = "The base64 encoded certificate data required to communicate with the EKS cluster"
}

output "token" {
  value       = data.aws_eks_cluster_auth.this.token
  description = "The token required to authenticate with the EKS cluster"
}
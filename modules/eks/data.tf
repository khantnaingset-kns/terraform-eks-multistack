data "aws_eks_cluster_auth" "this" {
  name = var.cluster_name

  depends_on = [aws_eks_cluster.this]
}
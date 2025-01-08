resource "kubernetes_namespace" "karpenter_namespace" {
  metadata {
    name = "karpenter"
  }
}

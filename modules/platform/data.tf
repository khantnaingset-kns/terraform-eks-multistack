data "kubernetes_service" "nginx_ingress" {
  metadata {
    # The name is usually just ingress-nginx-controller when installed via Helm
    name      = "${helm_release.nginx-ingress.name}-ingress-nginx-controller"
    namespace = "nginx-ingress"
  }

  depends_on = [helm_release.nginx-ingress]
}

data "kubernetes_secret" "argocd_secret" {
  metadata {
    name      = "argocd-initial-admin-secret"
    namespace = "argocd"
  }

  depends_on = [helm_release.argocd]
}
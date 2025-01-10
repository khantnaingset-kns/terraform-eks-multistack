resource "helm_release" "argocd" {
  name             = "argocd"
  namespace        = "argocd"
  create_namespace = true

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "7.7.13"


  set {
    name  = "server.ingress.enabled"
    value = "false" # We're using our own ingress
  }

  set {
    name  = "server.extraArgs[0]"
    value = "--basehref=/argocd"
  }

  set {
    name  = "server.extraArgs[1]"
    value = "--rootpath=/argocd"
  }

  set {
    name  = "server.ingress.enabled"
    value = "false" # We're using our own ingress
  }
}

resource "helm_release" "nginx-ingress" {
  name             = "nginx-ingress"
  namespace        = "nginx-ingress"
  create_namespace = true

  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-type"
    value = "nlb"
  }

}

resource "kubernetes_ingress_v1" "argocd_ui_server_https" {
  metadata {
    name      = "argocd-ingress"
    namespace = "argocd"
    annotations = {
      "nginx.ingress.kubernetes.io/force-ssl-redirect" = "true"
      "nginx.ingress.kubernetes.io/ssl-passthrough"    = "false"
      "nginx.ingress.kubernetes.io/backend-protocol"   = "HTTPS"
    }
  }

  spec {
    ingress_class_name = "nginx"
    rule {
      http {
        path {
          path      = "/argocd"
          path_type = "Prefix"
          backend {
            service {
              name = "argocd-server"
              port {
                name = "https"
              }
            }
          }
        }
      }
    }
  }
  depends_on = [helm_release.argocd]
}


output "nlb_address" {
  value = data.kubernetes_service.nginx_ingress.status.0.load_balancer.0.ingress.0.hostname
}

output "argocd_password" {
  value     = data.kubernetes_secret.argocd_secret.data.password
  sensitive = true
}
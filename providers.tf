provider "aws" {
  default_tags {
    tags = local.metadata
  }
}

provider "kubernetes" {
  host                   = module.eks.eks_host
  cluster_ca_certificate = module.eks.cluster_ca_certificate
  token                  = module.eks.token
}

provider "helm" {
  kubernetes {
    host                   = module.eks.eks_host
    cluster_ca_certificate = module.eks.cluster_ca_certificate
    token                  = module.eks.token
  }
}

provider "argocd" {

  server_addr        = "a52ab4ae6a979409695eab32a1e99b11-50c03e07ef4b7874.elb.us-east-1.amazonaws.com"
  insecure           = true
  grpc_web_root_path = "argocd"
  username           = "admin"
  password           = module.platform.argocd_password


}
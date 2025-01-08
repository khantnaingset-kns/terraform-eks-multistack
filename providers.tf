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
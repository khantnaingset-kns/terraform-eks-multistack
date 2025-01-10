resource "argocd_repository" "argo_aoa_repo" {
  name = "argo-aoa"

  repo     = "git@github.com:khantnaingset-kns/k8s-argocd-aoa.git"
  insecure = true

  ssh_private_key = file(var.repo_ssh_private_key_path)

}

resource "argocd_repository" "otel_dice_nest_repo" {
  name = "otel_dice_nest"

  repo     = "git@github.com:khantnaingset-kns/otel-nest-dice.git"
  insecure = true

  ssh_private_key = file(var.repo_ssh_private_key_path)

}

resource "argocd_application" "argo_aoa" {
  metadata {
    name      = "argo-aoa"
    namespace = "argocd"
  }

  wait = true

  spec {
    project = "default"

    destination {
      server    = "https://kubernetes.default.svc"
      namespace = "default"
    }

    source {
      repo_url        = argocd_repository.argo_aoa_repo.repo
      target_revision = "main"
      path            = "./"
      helm {
        release_name = "argo-aoa"
      }
    }

    sync_policy {
      automated {
        prune     = true
        self_heal = true
      }
    }
  }
}



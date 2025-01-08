terraform {
  backend "s3" {
    bucket       = "kns-tf-lab-state-store"
    key          = "state.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}
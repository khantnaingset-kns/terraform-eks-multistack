environment                 = "dev"
eks_cluster_role_policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
eks_cluster_role_name       = "eks-cluster-role"
eks_cluster_name            = "eks-cluster"
vpc_name                    = "eks-vpc"
vpc_cidr                    = "10.0.0.0/16"
eks_node_role_policy_arns = [
  "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy",
  "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy",
  "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
]
node_group_name           = "eks-node-group"
eks_admin_user_arn        = "arn:aws:iam::361769590917:user/admin"
repo_ssh_private_key_path = "~/.ssh/gh_ssh"
# Terraform EKS Provisioning Project

This repository contains Terraform configurations for provisioning an Amazon Elastic Kubernetes Service (EKS) cluster. The project is divided into multiple stacks for better modularity and management: **VPC**, **IAM**, **EKS**, and **Platform**.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Usage](#usage)
  - [Initialization](#initialization)
  - [Plan and Apply](#plan-and-apply)
- [Stacks](#stacks)
  - [IAM Stack](#iam-stack)
  - [EKS Stack](#eks-stack)
  - [Platform Stack](#platform-stack)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

1. **Terraform**: Install Terraform (>= 1.0.0). You can download it from [terraform.io](https://www.terraform.io/downloads).
2. **AWS CLI**: Configure AWS CLI with appropriate credentials and region.
3. **kubectl**: Required to interact with the EKS cluster.
4. **Helm**: Needed for deploying Helm charts on the platform stack.

## Project Structure

```plaintext
├── stacks/
│   ├── iam/          # IAM stack: Permissions and roles
│   ├── eks/          # EKS stack: Kubernetes cluster provisioning
│   ├── platform/     # Platform stack: Add-ons and applications
├── variables.tf       # Shared variables
├── outputs.tf         # Shared outputs
├── main.tf            # Main entry point for Terraform
├── README.md          # Project documentation
```

## Usage

### Initialization

Run the following command to initialize the project:

```bash
terraform init
```

### Plan and Apply

You can plan and apply changes for each stack individually or all at once.

To apply a specific stack, navigate to the stack folder:

```bash
terraform plan
terraform apply
```

To apply all stacks sequentially, you can use a script or manually execute them in the following order:

1. IAM
2. EKS
3. Platform


## Stacks

### IAM Stack

The IAM stack provisions roles and policies required for EKS and associated workloads.

### EKS Stack

The EKS stack provisions the EKS cluster and configures node groups.

### Platform Stack

The platform stack configures additional resources and applications, such as:
- Kubernetes namespaces
- Helm chart deployments (e.g., monitoring tools, ingress controllers)


## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your changes.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

# 🚀 fittingframework Infrastructure

Production-ready Infrastructure as Code (IaC) repository for deploying the **fittingframework
** application on **AWS** using **Terraform**, **Amazon EKS**, **GitHub Actions**, **Helm**, and **ArgoCD**.

This repository provisions and manages the complete cloud infrastructure required to deploy, scale, and maintain the FitInFrame application following modern DevOps and Infrastructure as Code best practices.

---

# 📌 Project Goals

- Provision AWS infrastructure using reusable Terraform modules
- Deploy Amazon EKS Cluster
- Automate infrastructure provisioning with GitHub Actions
- Deploy applications using ArgoCD (GitOps)
- Manage Kubernetes applications with Helm
- Follow production-ready Infrastructure as Code practices

---

# 🛠 Tech Stack

- Terraform
- AWS
- Amazon EKS
- Amazon EC2
- Amazon VPC
- Amazon S3
- IAM
- Security Groups
- GitHub Actions
- Kubernetes
- Helm
- ArgoCD

---

# 📂 Repository Structure

```text
fittingframework-infrastructure/
│
├── .github/
│   └── workflows/
│
├── terraform/
│
├── kubernetes/
│
├── helm/
│
├── argocd/
│
├── scripts/
│
├── docs/
│
├── .gitignore
├── LICENSE
└── README.md
```

---

# 🏗 Infrastructure Architecture

```
Developer
     │
GitHub
     │
GitHub Actions
     │
Terraform
     │
AWS
     │
VPC
     │
IAM
     │
Security Groups
     │
Amazon EKS
     │
Helm
     │
ArgoCD
     │
fittingframework Application
```

---

# 📦 Terraform Modules

This project uses reusable Terraform modules maintained in a separate repository.

Modules include:

- VPC
- IAM
- Security Group
- EC2
- Amazon S3
- Amazon EKS

---

# 🚀 Features

- Modular Infrastructure
- Reusable Terraform Modules
- Remote Terraform State
- Infrastructure as Code
- GitOps Deployment
- Kubernetes Orchestration
- Helm Package Management
- CI/CD Automation
- Production-ready Folder Structure

---

# 📅 Roadmap

- AWS Infrastructure Provisioning
- Remote State (S3 + DynamoDB)
- Amazon EKS Deployment
- GitHub Actions Pipeline
- Helm Deployment
- ArgoCD GitOps
- Monitoring with Prometheus & Grafana

---

# 📄 License

This project is licensed under the MIT License.

---

## 👨‍💻 Author

**Pushpendra Singh**

DevOps Engineer | AWS | Kubernetes | Terraform | GitHub Actions | Docker
# github-actions-demo
Developer
   ↓
GitHub Repo
   ↓
GitHub Actions
   ↓
Terraform creates AWS EC2
   ↓
App deploys automatically


File structure

terraform-aws-github-actions/
│
├── terraform/
│   ├── main.tf
│   ├── outputs.tf
│   ├── provider.tf
│   └── id_rsa.pub
│
├── app/
│   ├── index.js
│   ├── package.json
│
└── .github/
    └── workflows/
        └── deploy.yml


----------
Repo → Settings → Secrets and variables → Actions

EC2_SSH_KEY (private key)
EC2_USER   ubuntu
EC2_HOST   <IP>


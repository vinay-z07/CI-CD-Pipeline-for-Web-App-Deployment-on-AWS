# 🚀 CI/CD Pipeline for Web App Deployment on AWS

This project demonstrates an end-to-end CI/CD pipeline to automatically deploy a static web application on AWS EC2 instances. It uses **Terraform** for infrastructure provisioning, **Ansible** for server configuration, and **GitHub Actions** to automate the deployment process on every code push.

---

## 📁 Project Structure

<pre> <code>```project/
├── .github/
│ └── workflows/
│ └── deploy.yml # GitHub Actions workflow
├── terraform/
│ ├── main.tf # EC2, key pair, security group definitions
│ ├── variables.tf # Input variables
│ ├── outputs.tf # Output values
│ └── terraform.tfvars # Variable values
├── ansible/
│ ├── inventory.ini # Ansible inventory file
│ └── playbook.yml # Ansible playbook for server config
├── web/
│ └── index.html # Sample static web page
└── README.md ```</code> </pre>
---

## 🛠️ Tech Stack

- **AWS**: EC2, IAM, Security Groups
- **Terraform**: Infrastructure as Code
- **Ansible**: Server provisioning (e.g., install Nginx)
- **GitHub Actions**: Continuous Integration & Deployment
- **Linux**: Ubuntu (for EC2 instances)
- **Nginx**: Web server to host the static website
  
---
## 📦 Features

- Automatically provisions infrastructure using Terraform
- SSH key-based secure access
- Uses Ansible for post-provisioning setup (like installing Nginx)
- GitHub Actions triggers deployment pipeline on `push`
- Serves a static HTML file using Nginx
- Easy cleanup and modular design

---

## 🚀 Deployment Steps

# 1. Clone the Repo

**```bash 
git clone https://github.com/<your-username>/webapp-cicd-terraform-ansible.git
cd webapp-cicd-terraform-ansible**

# 2. Initialize and apply Terraform

**```bash
cd terraform
terraform init
terraform apply**

This will:

Create an EC2 instance

Set up the security group

Generate SSH key pairs (if defined)

# 3. Configure Ansible Inventory

(*After Terraform runs, get the EC2 public IP and add it to ansible/inventory.ini:*)  

**[web]
<ec2-public-ip> ansible_user=ubuntu ansible_ssh_private_key_file=../ssh_key/id_rsa**

---
# 4. (Optional) Run Ansible locally
**```bash
cd ansible
ansible-playbook -i inventory.ini playbook.yml
This installs Nginx and deploys your web/index.html to the EC2 instance.**

# 🔄 GitHub Actions Workflow
The .github/workflows/deploy.yml file runs on every push to main. 
It:
Connects to the EC2 instance using SSH

Runs the Ansible playbook remotely

Deploys the latest HTML from the web/ directory

Make sure to add the following GitHub Secrets:

AWS_ACCESS_KEY_ID

AWS_SECRET_ACCESS_KEY

ANSIBLE_SSH_PRIVATE_KEY (base64 encoded id_rsa)

# 🧼 Destroy Infrastructure
To remove all resources:

---
**```bash
cd terraform
terraform destroy**

# 🔐 Security
Use .gitignore to exclude id_rsa (never commit private keys)

Restrict inbound SSH access to your IP in the Terraform security group

Use GitHub Secrets for all sensitive values

# 📝 License
This project is licensed under the MIT License.

🙋‍♂️ Contact
Created by Your Name – feel free to reach out!
---

Let me know if you want help customizing this for your specific GitHub repo, name, or secrets configuration.

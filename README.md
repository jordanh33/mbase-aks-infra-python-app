# mb-azure

This provisions a simple, modular Azure environment using Terraform. It includes:

- ✅ Remote state backend on Azure Blob Storage
- ✅ Azure Resource Group & AKS cluster with configurable node pool
- ✅ Clean modular code structure
- ✅ Safe `.gitignore` and variable handling

---

AKS Module Overview
The AKS module (modules/aks/) provisions:

- An AKS cluster

- A default node pool with configurable node count

# Getting Started
✅ Prerequisites
- Terraform CLI
- Azure CLI

Log into Azure: az login

# Clone and Set Up
git clone https://github.com/jordanh33/mb-azure
cd mb-azure

# Initialize
terraform init
# Deploy
terraform apply
# Tear Down
terraform destroy

## note 
Added section to run before all this to create the storage account for the statefile 
- state-storage

once this is run you can uncomment the backend state file config to test, however for the purpose of this its been commented out so you can do a terraform validate 


# Python Hello World app



This part of the project deploys a simple Python Flask application to the Azure Kubernetes Service (AKS) cluster created in Part 1 using **Helm**.

---

## Application Overview

- A Python Flask web app that returns `"Hello World"` over HTTP
- Dockerised and pushed to a container registry (Docker Hub or ACR)
- Deployed to AKS using a Helm chart
- Exposed via a Kubernetes LoadBalancer service

---
python-app/
├── app/
│ ├── main.py # Flask app
│ ├── requirements.txt # Python deps
│ └── Dockerfile # Container config
├── hello-python/ # Helm chart
│ ├── Chart.yaml
│ ├── values.yaml
│ └── templates/
│ ├── deployment.yaml
│ └── service.yaml
└── README.md # This file


---

## Prerequisites

- Docker (to build and push the image)
- Python (optional, to run locally)
- Helm (v3+)
- Access to your AKS cluster (`az aks get-credentials`)
- A container registry (Docker Hub or Azure Container Registry)

---

## Quick Start

# Build and Push Docker Image
would usually have a pipeline doing this part, not manual 

docker build -t docker.registry/hello-python:latest ./app
docker push docker.registry/hello-python:latest

# Update Helm Chart
Edit hello-python/values.yaml:

image:
  repository: yourdockerhubuser/hello-python
  tag: latest

** i would have this pulled from vault variables or pipeline vars, not manually edited 

# Deploy to AKS

authenticate:

az aks get-credentials --resource-group main --name python-app

Then deploy using Helm:

helm install hello-python ./hello-python

# Access the App
Find the external IP:

kubectl get service hello-python

Then open in a browser:

http://<EXTERNAL-IP>/

You should see:

Hello World

### next steps for this would to be get a pipeline setup to do terraform plan, apply, destroy etc, and also to do the helm deployment 
### along with integrating vault or ci/cd secure variables for env specific vars 












#!/bin/bash

echo "🚀 Deploying Serverless API with Terraform..."
cd terraform || exit 1

terraform init
terraform apply -auto-approve

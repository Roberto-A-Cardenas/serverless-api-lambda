#!/bin/bash

echo "🔥 Destroying Serverless API infrastructure..."
cd terraform || exit 1

terraform destroy -auto-approve

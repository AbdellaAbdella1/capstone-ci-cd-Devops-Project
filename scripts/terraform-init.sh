#!/bin/bash
echo "Ì¥ß Initializing Terraform for AWS EKS..."

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "‚ùå AWS CLI not found. Please install it first."
    echo "Ì≥ñ Installation guide: https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html"
    exit 1
fi

# Check if AWS credentials are configured
if ! aws sts get-caller-identity &> /dev/null; then
    echo "‚ùå AWS credentials not configured."
    echo "Ì≤° Run: aws configure"
    exit 1
fi

# Initialize Terraform
cd infra/terraform
terraform init

echo "‚úÖ Terraform initialized successfully!"
echo "ÔøΩÔøΩ Next steps:"
echo "1. Review the plan: terraform plan"
echo "2. Deploy to AWS: terraform apply"
echo "3. Update kubeconfig: aws eks update-kubeconfig --region us-east-1 --name capstone-eks-cluster"

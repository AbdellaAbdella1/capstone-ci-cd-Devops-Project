#!/bin/bash
echo "Ì∫Ä DEPLOYING COMPLETE PROJECT WITH ANSIBLE"
echo "=========================================="

# Check if Ansible is installed
if ! command -v ansible &> /dev/null; then
    echo "‚ùå Ansible is not installed. Installing..."
    sudo apt update
    sudo apt install -y ansible
fi

# Run the complete deployment
ansible-playbook ansible/playbooks/deploy-complete.yml -i ansible/inventory.ini

echo "‚úÖ Ansible deployment completed!"

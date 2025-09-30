#!/bin/bash
echo "í³ Project Structure Verification"
echo "================================="

echo "âœ… Core Application:"
find app/ -type f -name "*.js" -o -name "*.json" -o -name "*.env" 2>/dev/null | sort

echo ""
echo "âœ… Docker Configuration:"
find docker/ -type f 2>/dev/null | sort

echo ""
echo "âœ… Kubernetes Manifests:"
find k8s/ -type f -name "*.yaml" -o -name "*.yml" 2>/dev/null | sort

echo ""
echo "âœ… Monitoring Stack:"
find monitoring/ -type f -name "*.yaml" -o -name "*.yml" -o -name "*.json" 2>/dev/null | sort

echo ""
echo "âœ… Infrastructure as Code:"
find infra/ -type f -name "*.tf" 2>/dev/null | sort

echo ""
echo "âœ… Ansible Playbooks:"
find ansible/ -type f -name "*.yml" -o -name "*.ini" 2>/dev/null | sort

echo ""
echo "âœ… Scripts:"
find scripts/ -type f -name "*.sh" 2>/dev/null | sort

echo ""
echo "í¾‰ Project structure is complete!"

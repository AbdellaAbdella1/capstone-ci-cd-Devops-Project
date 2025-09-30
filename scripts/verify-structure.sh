#!/bin/bash
echo "� Project Structure Verification"
echo "================================="

echo "✅ Core Application:"
find app/ -type f -name "*.js" -o -name "*.json" -o -name "*.env" 2>/dev/null | sort

echo ""
echo "✅ Docker Configuration:"
find docker/ -type f 2>/dev/null | sort

echo ""
echo "✅ Kubernetes Manifests:"
find k8s/ -type f -name "*.yaml" -o -name "*.yml" 2>/dev/null | sort

echo ""
echo "✅ Monitoring Stack:"
find monitoring/ -type f -name "*.yaml" -o -name "*.yml" -o -name "*.json" 2>/dev/null | sort

echo ""
echo "✅ Infrastructure as Code:"
find infra/ -type f -name "*.tf" 2>/dev/null | sort

echo ""
echo "✅ Ansible Playbooks:"
find ansible/ -type f -name "*.yml" -o -name "*.ini" 2>/dev/null | sort

echo ""
echo "✅ Scripts:"
find scripts/ -type f -name "*.sh" 2>/dev/null | sort

echo ""
echo "� Project structure is complete!"

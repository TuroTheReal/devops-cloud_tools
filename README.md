# DEVOPS CLOUD TOOLS

<p align="center">
  <img src="https://img.shields.io/badge/Status-Active-success.svg"/>
  <img src="https://img.shields.io/badge/Type-Reusable_Assets-blue.svg"/>
  <img src="https://img.shields.io/badge/License-MIT-yellow.svg"/>
</p>

<p align="center">
  <i>Reusable scripts, configs, and templates extracted from real DevOps projects</i>
</p>

---

## Table of Contents
- [About](#about)
- [Content Structure](#content-structure)
- [Usage Guide](#usage-guide)
- [Categories](#categories)
- [Best Practices](#best-practices)
- [Contributing](#contributing)
- [Related Resources](#related-resources)

## About

**DevOps Cloud Tools** is a collection of battle-tested, reusable assets extracted from real projects. Every script, config, and template here has been used in production or real-world scenarios and proven valuable enough to save for future use.

### Why This Repository?

This repository helps with:
- **Save Time**: Reuse proven solutions instead of reinventing the wheel
- **Consistency**: Apply the same patterns across multiple projects
- **Quality**: Use tested assets rather than untested experiments
- **Knowledge Transfer**: Share working solutions across projects and teams
- **Rapid Prototyping**: Bootstrap new projects quickly

### Source of Assets

All assets in this repository are extracted from:
- ✅ Production deployments and client work
- ✅ Personal experimentation that proved valuable
- ✅ Community contributions (with proper attribution)

**Quality Standard**: If it's here, it works. No theoretical or untested code.

---

## Content Structure

```
devops-cloud_tools/
├── scripts/                  # Automation scripts
│   ├── docker/              # Container management
│   ├── kubernetes/          # K8s operations
│   ├── terraform/           # IaC automation
│   ├── ansible/             # Config management
│   ├── aws/                 # AWS utilities
│   └── utils/               # General utilities
├── configs/                 # Configuration templates
│   ├── docker/              # Dockerfiles, compose files
│   ├── kubernetes/          # K8s manifests
│   ├── terraform/           # TF modules and configs
│   └── ci-cd/               # Pipeline configs
├── templates/               # Boilerplate code
│   ├── Dockerfile.python
│   ├── Dockerfile.node
│   └── docker-compose.webapp.yml
└── README.md                # This file
```

### Naming Conventions

- **Scripts**: `verb-action.sh` or `verb-action.py`
  - Examples: `deploy-terraform.sh`, `backup-database.py`, `health-check.sh`
- **Configs**: `service-type.ext` or `purpose-template.ext`
  - Examples: `backend-s3.tf`, `nginx-proxy.conf`, `deployment-template.yaml`
- **Templates**: `Dockerfile.language` or `compose-type.yml`
  - Examples: `Dockerfile.python`, `compose-webapp.yml`

---

## Usage Guide

### Using Scripts

```bash
# 1. Find the script you need
cd devops-cloud_tools/scripts/terraform/

# 2. Read the documentation at the top of the file
head -n 30 deploy-terraform.sh

# 3. Adapt to your needs (copy, don't link directly)
cp deploy-terraform.sh ~/my-project/scripts/
cd ~/my-project/scripts/
nano deploy-terraform.sh  # Customize for your project

# 4. Test before using in production
./deploy-terraform.sh --dry-run
```

### Using Configs

```bash
# 1. Browse available configs
ls devops-cloud_tools/configs/kubernetes/

# 2. Copy template to your project
cp devops-cloud_tools/configs/kubernetes/deployment-template.yaml \
   ~/my-project/k8s/deployment.yaml

# 3. Customize values
nano ~/my-project/k8s/deployment.yaml

# 4. Apply in your environment
kubectl apply -f ~/my-project/k8s/deployment.yaml
```

### Using Templates

```bash
# 1. Choose appropriate template
ls devops-cloud_tools/templates/

# 2. Copy to your project
cp devops-cloud_tools/templates/Dockerfile.python \
   ~/my-project/Dockerfile

# 3. Modify for your specific needs
nano ~/my-project/Dockerfile

# 4. Build and test
docker build -t my-app .
```

---

## Categories

### 🐳 Docker

**Scripts**:
- Coming soon: Container management utilities
- Coming soon: Image cleanup and optimization

**Configs**:
- Coming soon: Multi-stage Dockerfile templates
- Coming soon: Docker Compose examples

**Templates**:
- Coming soon: Language-specific Dockerfiles

---

### ☸️ Kubernetes

**Scripts**:
- Coming soon: Pod restart automation
- Coming soon: Resource cleanup utilities
- Coming soon: Health check scripts

**Configs**:
- Coming soon: Deployment templates
- Coming soon: Service and Ingress examples
- Coming soon: ConfigMap and Secret patterns

---

### 🏗️ Terraform

**Scripts**:
- Coming soon: State management automation
- Coming soon: Deployment scripts
- Coming soon: Resource cleanup

**Configs**:
- Coming soon: Backend configuration templates
- Coming soon: Provider setup examples
- Coming soon: Reusable modules

---

### 📜 Ansible

**Scripts**:
- Coming soon: Inventory management
- Coming soon: Playbook testing utilities

**Configs**:
- Coming soon: Role templates
- Coming soon: Inventory examples

---

### ☁️ AWS

**Scripts**:
- Coming soon: S3 operations
- Coming soon: EC2 management
- Coming soon: IAM utilities

**Configs**:
- Coming soon: CloudFormation templates
- Coming soon: Lambda function examples

---

### 🛠️ Utilities

**Scripts**:
- Coming soon: Backup automation
- Coming soon: Log analysis tools
- Coming soon: Monitoring helpers

---

## Best Practices

### 📖 Using Assets

1. **Always Copy, Never Link**: Copy assets to your project, don't symlink
2. **Customize**: Adapt scripts/configs to your specific needs
3. **Test First**: Run in dev/staging before production
4. **Document Changes**: Note what you modified and why
5. **Version Control**: Commit customized assets to your project repo

### ✍️ Contributing New Assets

When adding new assets from projects:

1. **Extract After Success**: Only add assets that worked well in production
2. **Generalize**: Remove project-specific values, use placeholders
3. **Document Thoroughly**:
   - Add header comments explaining purpose
   - Include usage examples
   - List prerequisites and dependencies
   - Note any limitations or edge cases
4. **Test Standalone**: Ensure asset works outside original context
5. **Link Source**: Reference the project it came from
6. **Update READMEs**: Add entry to relevant section

### 🎯 Quality Standards

All assets must meet these criteria:

- ✅ **Tested**: Used successfully in at least one real project
- ✅ **Documented**: Clear comments explaining purpose and usage
- ✅ **Generalized**: No hardcoded project-specific values
- ✅ **Self-Contained**: Include all dependencies or document them
- ✅ **Safe**: Include error handling and validation
- ✅ **Maintained**: Update when better approaches are discovered

### 💡 Extraction Workflow

From project to tools repository:

```bash
# 1. Identify reusable asset in your project
cd ~/projects/my-terraform-project/
# Found: scripts/deploy.sh is really useful

# 2. Copy to tools repo
cp scripts/deploy.sh ~/devops-cloud_tools/scripts/terraform/deploy-terraform.sh

# 3. Generalize the script
cd ~/devops-cloud_tools/scripts/terraform/
nano deploy-terraform.sh
# - Remove hardcoded values
# - Add configuration variables
# - Improve error handling
# - Add usage documentation

# 4. Document extraction in project learnings
cd ~/devops-cloud_vault/projects/2025-12-my-project/
nano learnings.md
# Add to "Reusable Assets" section

# 5. Commit to tools repo
cd ~/devops-cloud_tools/
git add scripts/terraform/deploy-terraform.sh
git commit -m "Add: Terraform deployment script from project X"
git push

# 6. Update tools README
nano scripts/terraform/README.md  # Add script to list
```

---

## Contributing

### Adding New Assets

```bash
# 1. Create appropriate directory if needed
mkdir -p scripts/[technology]/

# 2. Add your asset with clear naming
cp ~/project/useful-script.sh scripts/[technology]/descriptive-name.sh

# 3. Add documentation header
nano scripts/[technology]/descriptive-name.sh

# 4. Test that it works standalone
cd /tmp
bash ~/devops-cloud_tools/scripts/[technology]/descriptive-name.sh --help

# 5. Update relevant README
nano scripts/[technology]/README.md

# 6. Commit with clear message
git add .
git commit -m "Add: [description] extracted from [project]"
```

### Documentation Template for Scripts

```bash
#!/usr/bin/env bash
#
# Script: descriptive-name.sh
# Description: [What this script does]
# Usage: ./descriptive-name.sh [options]
#
# Prerequisites:
#   - [Tool 1] (version X.Y+)
#   - [Tool 2]
#
# Options:
#   -h, --help     Show this help message
#   -v, --verbose  Enable verbose output
#
# Examples:
#   ./descriptive-name.sh --option value
#   ./descriptive-name.sh --dry-run
#
# Source: Extracted from [project-name] (YYYY-MM)
# Tested on: [OS/environment]
#

set -euo pipefail
# [Your script code here]
```

---

## Related Resources

### Internal Links
- [devops-cloud_vault](https://github.com/TuroTheReal/devops-cloud_vault) - Knowledge base and project learnings
- [devops-cloud_vault/projects/](https://github.com/TuroTheReal/devops-cloud_vault/tree/main/projects) - Source projects for these assets

### External Resources
- [DevOps Best Practices](https://12factor.net/) - Twelve-Factor App methodology
- [Awesome DevOps](https://github.com/awesome-devops/awesome-devops) - Curated list of DevOps resources

---

## Statistics

- **Total Scripts**: 0 (Ready to extract!)
- **Total Configs**: 0
- **Total Templates**: 0
- **Last Updated**: 2025-12-23
- **Projects Contributing**: 0

---

## License

MIT License - Feel free to use these assets in your own projects.

See [LICENSE](LICENSE) file for details.

---

## Contact

- **GitHub**: [@TuroTheReal](https://github.com/TuroTheReal)
- **Email**: arthurbernard.dev@gmail.com
- **LinkedIn**: [Arthur Bernard](https://www.linkedin.com/in/arthurbernard92/)

---

<p align="center">
  <b>⭐ Reuse, adapt, improve!</b>
</p>

<p align="center">
  Companion repository to <a href="https://github.com/TuroTheReal/devops-cloud_vault">DevOps Cloud Vault</a>
</p>

---

**Last Updated**: 2025-12-23
**Version**: 1.0
**Maintained by**: Arthur Bernard
**Philosophy**: Extract from experience, reuse with confidence

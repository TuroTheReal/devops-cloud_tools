# SCRIPTS

<p align="center">
  <img src="https://img.shields.io/badge/Status-Active-success.svg"/>
  <img src="https://img.shields.io/badge/Type-Automation-blue.svg"/>
  <img src="https://img.shields.io/badge/Tested-Production-green.svg"/>
</p>

<p align="center">
  <i>Battle-tested automation scripts extracted from real DevOps projects</i>
</p>

---

## About

This folder contains reusable automation scripts for common DevOps tasks. Every script here has been used in production or real-world scenarios and proven valuable.

**Quality Standard**: All scripts are:
- ✅ Tested in real projects
- ✅ Well-documented with usage examples
- ✅ Generalized (no hardcoded project values)
- ✅ Safe (error handling and validation)
- ✅ Maintained and updated

---

## Content Structure

```
scripts/
├── docker/              # Container management
├── kubernetes/          # K8s operations
├── terraform/           # IaC automation
├── ansible/             # Config management
├── aws/                 # AWS utilities
├── cloudflare/          # Cloudflare edge: Pages -> Workers cutover (available)
├── utils/               # General utilities
└── README.md            # This file
```

---

## Quick Start

### Using a Script

```bash
# 1. Browse available scripts
ls scripts/terraform/

# 2. Read documentation
head -n 30 scripts/terraform/deploy.sh

# 3. Copy to your project (don't link)
cp scripts/terraform/deploy.sh ~/my-project/scripts/

# 4. Customize for your needs
nano ~/my-project/scripts/deploy.sh

# 5. Test before production use
./deploy.sh --dry-run
```

### Script Documentation Standard

Each script includes a header with:
- **Purpose**: What the script does
- **Usage**: Command-line syntax and options
- **Prerequisites**: Required tools and versions
- **Examples**: Common usage patterns
- **Source**: Which project it was extracted from

---

## Available Scripts

Each category folder owns its full script list and usage docs (the source of
truth). This index only points to them.

| Category | Status | What's inside |
| --- | --- | --- |
| [☁️ Cloudflare](cloudflare/) | Active | Pages -> Workers cutover + rollback (custom domain / worker route) |
| [🛠️ Utilities](utils/) | Active | host / HTTP monitoring during a switch |
| 🐳 Docker | Planned | container management |
| ☸️ Kubernetes | Planned | k8s operations |
| 🏗️ Terraform | Planned | IaC automation |
| 📜 Ansible | Planned | config management |
| ☁️ AWS | Planned | AWS utilities |

---

## Best Practices

### Using Scripts

1. **Always copy, never symlink**: Scripts should be versioned with your project
2. **Read before running**: Understand what the script does
3. **Test in dev/staging**: Never run untested scripts in production
4. **Customize appropriately**: Adapt to your specific needs
5. **Add error handling**: Enhance based on your requirements

### Contributing Scripts

When adding new scripts:

1. **Generalize first**: Remove project-specific hardcoded values
2. **Document thoroughly**: Clear header comments and usage examples
3. **Test standalone**: Ensure it works outside original project
4. **Handle errors**: Include proper error checking
5. **Follow conventions**: Use naming pattern `verb-action.sh`

### Script Template

```bash
#!/usr/bin/env bash
#
# Script: descriptive-name.sh
# Description: Clear one-line description
# Usage: ./descriptive-name.sh [options] [arguments]
#
# Prerequisites:
#   - bash 4.0+
#   - [required tool] (version X.Y+)
#
# Options:
#   -h, --help        Show this help message
#   -v, --verbose     Enable verbose output
#   -d, --dry-run     Show what would be done without doing it
#   -f, --force       Skip confirmations
#
# Examples:
#   ./descriptive-name.sh                    # Default behavior
#   ./descriptive-name.sh --verbose          # With detailed output
#   ./descriptive-name.sh --dry-run          # Preview mode
#
# Source: Extracted from [project-name] (YYYY-MM)
# Tested on: Ubuntu 22.04, macOS 14.0
# Last updated: YYYY-MM-DD
#

set -euo pipefail  # Exit on error, undefined vars, pipe failures

# Script code here...
```

---

## Contributing

To add a new script:

```bash
# 1. Create technology folder if needed
mkdir -p scripts/[technology]/

# 2. Add your script
cp ~/project/script.sh scripts/[technology]/descriptive-name.sh

# 3. Add proper documentation header
nano scripts/[technology]/descriptive-name.sh

# 4. Test independently
cd /tmp
bash ~/devops-cloud_tools/scripts/[technology]/descriptive-name.sh --help

# 5. Update this README if starting new category

# 6. Commit
git add scripts/[technology]/descriptive-name.sh
git commit -m "Add: [description] from [project]"
```

---

## Statistics

- **Live categories**: Cloudflare, Utilities
- **Planned**: Docker, Kubernetes, Terraform, Ansible, AWS
- **Last Updated**: 2026-06-24

---

**Last Updated**: 2026-06-24
**Maintained by**: Arthur Bernard

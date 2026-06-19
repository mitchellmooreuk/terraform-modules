# Terraform Modules

Disclaimer: AI was used to generate this file.

This repository houses a collection of reusable, version-controlled Terraform modules designed to provision and manage infrastructure across my personal projects and homelab ecosystem.

## Purpose

The primary goal of this repository is to abstract complex resource footprints (like virtual machines and Linux containers) into modular, production-grade blueprints. By using semantic version tagging, these modules ensure consistency, prevent configuration drift, and allow isolated, non-breaking infrastructure updates across different active project repositories.

## Usage

To reference a module in an external root infrastructure configuration, target the specific sub-folder and append the desired version tag via the Git ref query string:

```hcl
module "your-module" {
  source = "git@github.com:mitchellmooreuk/terraform-modules.git//modules/module-name?ref=vX.X.X"

  # inputs here... #
}

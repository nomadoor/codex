terraform {
  required_version = ">= 1.5.0"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.api_token
}

resource "cloudflare_pages_project" "hello_world" {
  account_id        = var.account_id
  name              = var.project_name
  production_branch = var.production_branch

  deployment_configs {
    production {}
    preview    {}
  }

  source {
    type = var.pages_source_type

    config {
      owner             = var.repo_owner
      repo_name         = var.repo_name
      production_branch = var.production_branch
    }
  }
}

resource "cloudflare_pages_domain" "custom" {
  count = var.custom_domain == "" ? 0 : 1

  account_id   = var.account_id
  project_name = cloudflare_pages_project.hello_world.name
  domain       = var.custom_domain
}
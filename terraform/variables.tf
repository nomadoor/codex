variable "api_token" {
  description = "Cloudflare API token with permission to manage Pages projects and custom domains."
  type        = string
  sensitive   = true
}

variable "account_id" {
  description = "Cloudflare account identifier that owns the Pages project."
  type        = string
}

variable "project_name" {
  description = "Name to give the Cloudflare Pages project."
  type        = string
  default     = "hello-world"
}

variable "production_branch" {
  description = "Branch that Cloudflare Pages should treat as the production branch."
  type        = string
  default     = "main"
}

variable "pages_source_type" {
  description = "Source integration type for the Pages project (github, gitlab, or bitbucket)."
  type        = string
  default     = "github"

  validation {
    condition     = contains(["github", "gitlab", "bitbucket"], lower(var.pages_source_type))
    error_message = "pages_source_type must be one of github, gitlab, or bitbucket."
  }
}

variable "repo_owner" {
  description = "Owner or organization name for the repository that hosts the site content."
  type        = string
}

variable "repo_name" {
  description = "Repository name that contains the site content."
  type        = string
}

variable "custom_domain" {
  description = "Optional custom domain to attach to the Pages project. Leave blank to skip."
  type        = string
  default     = ""
}
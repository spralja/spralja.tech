variable "billing_account" {
  description = "The alphanumeric ID of a billing account"
  type        = string
}

variable "project" {
  description = "The project ID of a Google Cloud Platform project"
  type        = string
}

variable "region" {
  description = "The default region to manage resources in"
  type        = string
}

variable "github_user" {
  description = "The GitHub username"
  type        = string
}

variable "github_repo" {
  description = "The GitHub repository name"
  type        = string
}

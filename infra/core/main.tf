resource "google_project" "default" {
  billing_account = var.billing_account

  name       = var.project
  project_id = var.project

  auto_create_network = false
}

resource "google_storage_bucket" "default" {
  name     = "${var.project}-tfstate"
  location = var.region

  public_access_prevention = "enforced"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      num_newer_versions = 10
    }
  }
}

resource "google_cloudbuildv2_repository" "default" {
  name     = var.github_repo
  location = var.region

  remote_uri        = "https://github.com/${var.github_user}/${var.github_repo}.git"
  parent_connection = "projects/${var.project}/locations/${var.region}/connections/github-${var.github_user}"
}
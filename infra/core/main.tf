resource "google_project" "default" {
  billing_account = var.billing_account

  name       = var.project
  project_id = var.project

  auto_create_network = false
}

resource "google_storage_bucket" "default" {
  name = "${var.project}-tfstate"
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

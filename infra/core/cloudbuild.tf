locals {
  trigger_name = "tf-apply"
}

resource "google_cloudbuildv2_repository" "default" {
  name     = var.github_repo
  location = var.region

  remote_uri        = "https://github.com/${var.github_user}/${var.github_repo}.git"
  parent_connection = "projects/${var.project}/locations/${var.region}/connections/github-${var.github_user}"
}

resource "google_service_account" "default" {
  account_id = "cloudbuild-${local.trigger_name}"
}

resource "google_project_iam_binding" "default" {
  project = var.project
  role    = "roles/logging.logWriter"
  members = [
    "serviceAccount:${google_service_account.default.email}",
  ]
}

resource "google_cloudbuild_trigger" "default" {
  name     = local.trigger_name
  location = var.region

  include_build_logs = "INCLUDE_BUILD_LOGS_WITH_STATUS"

  filename = "infra/services/cloudbuild.yaml"

  repository_event_config {
    repository = google_cloudbuildv2_repository.default.id

    push {
      branch = "^main$"
    }
  }

  service_account = google_service_account.default.id
}
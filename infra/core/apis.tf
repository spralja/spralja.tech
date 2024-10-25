locals {
  services = toset([
    "compute.googleapis.com",
    "cloudbuild.googleapis.com",
    "artifactregistry.googleapis.com",
    "logging.googleapis.com",
    "oslogin.googleapis.com",
    "pubsub.googleapis.com",
    "containerregistry.googleapis.com",
    "storage-api.googleapis.com",
    "iamcredentials.googleapis.com",
    "iam.googleapis.com",
    "secretmanager.googleapis.com",
  ])
}

resource "google_project_service" "default" {
  for_each = local.services

  service = each.key
}

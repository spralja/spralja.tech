resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
}

resource "google_project_service" "oslogin" {
  service = "oslogin.googleapis.com"
}

resource "google_project_service" "cloudbuild" {
  service = "cloudbuild.googleapis.com"
}

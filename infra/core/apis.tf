resource "google_project_service" "compute_api" {
  service = "compute.googleapis.com"
}

resource "google_project_service" "oslogin" {
  service = "oslogin.googleapis.com"
}

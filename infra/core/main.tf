resource "google_project" "default" {
  billing_account = var.billing_account

  name       = var.project
  project_id = var.project

  auto_create_network = false
}

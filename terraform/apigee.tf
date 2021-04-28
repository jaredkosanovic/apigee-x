resource "google_apigee_organization" "this" {
  analytics_region                     = var.gcp_region
  display_name                         = var.org_name
  project_id                           = var.gcp_project
  authorized_network                   = data.google_compute_network.default.id
  runtime_database_encryption_key_name = google_kms_crypto_key.this.id
  runtime_type                         = "CLOUD"

  depends_on = [
    google_service_networking_connection.this,
    google_kms_crypto_key_iam_binding.this,
  ]
}
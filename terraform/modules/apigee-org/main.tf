resource "google_apigee_organization" "this" {
  analytics_region                     = var.gcp_region
  display_name                         = var.apigee_display_name
  project_id                           = var.gcp_project
  authorized_network                   = data.google_compute_network.default.id
  runtime_database_encryption_key_name = google_kms_crypto_key.database.id
  runtime_type                         = "CLOUD"

  depends_on = [
    google_service_networking_connection.this,
    google_kms_crypto_key_iam_binding.database,
  ]
}

resource "google_apigee_instance" "this" {
  name                     = var.apigee_display_name
  location                 = var.gcp_region
  org_id                   = google_apigee_organization.this.id
  disk_encryption_key_name = google_kms_crypto_key.disk.id
  peering_cidr_range       = "SLASH_16"

  depends_on = [
    google_service_networking_connection.this,
    google_kms_crypto_key_iam_binding.disk,
  ]
}
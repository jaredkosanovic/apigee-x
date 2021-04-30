resource "google_kms_key_ring" "database" {
  name     = "apigee-database"
  location = var.gcp_region
}

resource "google_kms_crypto_key" "database" {
  name     = "apigee-database"
  key_ring = google_kms_key_ring.database.id
  purpose  = "ENCRYPT_DECRYPT"

  lifecycle {
    prevent_destroy = true
  }
}

# Once created, this resource cannot be updated or destroyed. These actions are a no-op.
# These resources are in beta, and should be used with the terraform-provider-google-beta provider.
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service_identity
resource "google_project_service_identity" "apigee" {
  provider = google-beta
  project  = var.gcp_project
  service  = google_project_service.apigee.service
}

resource "google_kms_crypto_key_iam_binding" "database" {
  crypto_key_id = google_kms_crypto_key.database.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  members = [
    "serviceAccount:${google_project_service_identity.apigee.email}",
  ]
}

resource "google_kms_key_ring" "disk" {
  name     = "apigee-disk"
  location = var.gcp_region
}

resource "google_kms_crypto_key" "disk" {
  name     = "apigee-disk"
  key_ring = google_kms_key_ring.database.id
  purpose  = "ENCRYPT_DECRYPT"

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_kms_crypto_key_iam_binding" "disk" {
  crypto_key_id = google_kms_crypto_key.disk.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  members = [
    "serviceAccount:${google_project_service_identity.apigee.email}",
  ]
}
resource "google_kms_key_ring" "this" {
  name     = "apigee"
  location = var.gcp_region
}

resource "google_kms_crypto_key" "this" {
  name     = "apigee"
  key_ring = google_kms_key_ring.this.id
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

resource "google_kms_crypto_key_iam_binding" "this" {
  crypto_key_id = google_kms_crypto_key.this.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  members = [
    "serviceAccount:${google_project_service_identity.apigee.email}",
  ]
}
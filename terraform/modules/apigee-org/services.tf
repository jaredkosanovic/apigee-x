# https://cloud.google.com/apigee/docs/api-platform/get-started/install-cli#enable-apis

resource "google_project_service" "apigee" {
  service = "apigee.googleapis.com"
}

resource "google_project_service" "service_networking" {
  service = "servicenetworking.googleapis.com"
}

resource "google_project_service" "compute" {
  service = "compute.googleapis.com"
}

resource "google_project_service" "cloud_kms" {
  service = "cloudkms.googleapis.com"
}
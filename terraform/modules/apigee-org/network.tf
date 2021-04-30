data "google_compute_network" "default" {
  name = var.network_name
}

# https://cloud.google.com/apigee/docs/api-platform/get-started/install-cli#service-networking

resource "google_compute_global_address" "this" {
  name          = "apigee"
  prefix_length = 16
  description   = "Peering range for Google services"
  network       = data.google_compute_network.default.name
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
}

resource "google_service_networking_connection" "this" {
  network                 = data.google_compute_network.default.name
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.this.name]
}
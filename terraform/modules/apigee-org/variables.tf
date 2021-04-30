variable "gcp_region" {
  type        = string
  description = "GCP region"
}

variable "gcp_project" {
  type        = string
  description = "GCP project ID"
}

variable "network_name" {
  type        = string
  description = "Name of the default network to use for peering with the Apigee X runtime."
}

variable "apigee_display_name" {
  type        = string
  description = "Human readable name for Apigee orgs and instances."
}

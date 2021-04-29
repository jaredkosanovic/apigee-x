variable "gcp_region" {
  type        = string
  description = "GCP region"
  default     = "us-central1"
}

variable "gcp_project" {
  type        = string
  description = "GCP project ID"
  default     = "doit-ipt-apigee-dev-808d"
}

variable "network_name" {
  type        = string
  description = "Name of the default network to use for peering with the Apigee X runtime."
  default     = "uw-default-doit-ipt-apigee-dev"
}

variable "org_name" {
  type        = string
  description = "Display name of Apigee organization."
  default     = "Development"
}

variable "instance_name" {
  type        = string
  description = "Display name of Apigee instance."
  default     = "Development"
}

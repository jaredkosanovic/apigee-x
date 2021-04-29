module "apigee_org" {
  source = "../modules/apigee-org"

  gcp_region = var.gcp_region
  gcp_project = var.gcp_project
  network_name = "uw-default-doit-ipt-apigee-dev"
  apigee_display_name = "Development"
}
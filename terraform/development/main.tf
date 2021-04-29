module "apigee_org" {
  source = "../modules/apigee-org"

  gcp_region          = var.gcp_region
  gcp_project         = var.gcp_project
  network_name        = "uw-default-doit-ipt-apigee-dev"
  apigee_display_name = "Development"
}

resource "google_apigee_environment" "framework" {
  name         = "framework"
  display_name = "Framework"
  description  = "Environment for framework development."
  org_id       = module.apigee_org.org_id
}

resource "google_apigee_instance_attachment" "framework" {
  instance_id = module.apigee_org.instance_id
  environment = google_apigee_environment.framework.name
}

resource "google_apigee_environment" "ipt" {
  name         = "ipt"
  display_name = "Integration Platform Team"
  description  = "Environment for DoIT Integration Platform Team."
  org_id       = module.apigee_org.org_id
}

resource "google_apigee_instance_attachment" "ipt" {
  instance_id = module.apigee_org.instance_id
  environment = google_apigee_environment.ipt.name
}

resource "google_apigee_envgroup" "doit" {
  name   = "DoIT"
  org_id = module.apigee_org.org_id
  #TODO: Hostnames
}

resource "google_apigee_envgroup_attachment" "framework" {
  envgroup_id = google_apigee_envgroup.doit.name
  environment = google_apigee_environment.framework.name
}

resource "google_apigee_envgroup_attachment" "ipt" {
  envgroup_id = google_apigee_envgroup.doit.name
  environment = google_apigee_environment.ipt.name
}
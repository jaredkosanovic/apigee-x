output "org_id" {
  value       = google_apigee_organization.this.id
  description = "ID of the Apigee organization."
}

output "instance_id" {
  value       = google_apigee_instance.this.id
  description = "ID of the Apigee instance."
}
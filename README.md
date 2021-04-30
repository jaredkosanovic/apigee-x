# Apigee Infrastructure

This repository is meant for documentation and configuration of UW-Madison's Apigee environment.

## Developer Setup

### Prerequisites
- [Terraform](https://www.terraform.io/downloads.html)
- [Google Cloud SDK](https://cloud.google.com/sdk)
- Reach out to another team member to get access to the Google Cloud Platform projects. Access is granted through Google Groups.
    - [doit-ipt-apigee-dev](https://groups.google.com/a/g-groups.wisc.edu/g/doit-ipt-apigee-dev/members)
    - [doit-ipt-apigee-pre-prod](https://groups.google.com/a/g-groups.wisc.edu/g/doit-ipt-apigee-pre-prod)
    - [doit-ipt-apigee-prod](https://groups.google.com/a/g-groups.wisc.edu/g/doit-ipt-apigee-prod)

### Backend Setup

Terraform state is stored in a Cloud Storage bucket.
The bucket is created outside of Terraform.

Example for the development project:
```bash
gcloud auth login
gsutil mb -p $PROJECT_ID -c REGIONAL -l us-central1 -b on gs://apigee-terraform-state-dev
gsutil versioning set on gs://apigee-terraform-state-dev
```

Cloud Storage bucket names are globally unique, so different names will need to be chosen for different GCP projects.

### Provision GCP Resources with Terraform

Terraform configuration for high-level Apigee resources are stored in a [module](./terraform/modules/apigee-org) to enable reuse and deduplication.
Each Apigee organization is in a separate directory.

Example steps to provision the development Apigee organization.
```bash
cd terraform/development
terraform init
terraform apply
```
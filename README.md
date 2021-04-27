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

```bash
gcloud auth login
gsutil mb -p $PROJECT_ID -c REGIONAL -l us-central1 -b on gs://apigee-terraform-state
gsutil versioning set on gs://apigee-terraform-state
```

### Provision GCP Resources with Terraform

```bash
cd terraform
terraform init
terraform apply
```
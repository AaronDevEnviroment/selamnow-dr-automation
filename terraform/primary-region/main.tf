# Primary Region Infrastructure Definition
# This module defines the SelamNow Tier-1 Primary Active environment.

variable "is_active" {
  description = "Boolean to control if this region is actively serving traffic."
  type        = bool
  default     = true
}

module "region_a_cluster" {
  source = "../../modules/kubernetes-cluster"
  # EKS/GKE base definition for primary workloads
  region = "primary-region"
  active = var.is_active
}

module "region_a_database" {
  source = "../../modules/postgresql-ha"
  # Primary DB accepting writes 
  role = var.is_active ? "primary" : "standby"
}

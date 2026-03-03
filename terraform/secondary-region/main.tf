# Secondary Region Infrastructure Definition
# This module defines the SelamNow Tier-1 Hot Standby environment.

variable "is_active" {
  description = "Boolean to control if this region is actively serving traffic."
  type        = bool
  default     = false
}

module "region_b_cluster" {
  source = "../../modules/kubernetes-cluster"
  # EKS/GKE base definition for secondary workloads
  region = "secondary-region"
  active = var.is_active
}

module "region_b_database" {
  source = "../../modules/postgresql-ha"
  # Standby DB accepting replication
  role = var.is_active ? "primary" : "standby"
}

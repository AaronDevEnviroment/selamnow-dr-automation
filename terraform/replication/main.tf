# Cross-Region Replication Infrastructure
# Defines the networking peering, WAL archive buckets, and streaming channels.

module "vpc_peering" {
  source = "../../modules/vpc-peering"
  network_a = "primary-region-vpc"
  network_b = "secondary-region-vpc"
}

module "wal_archive_bucket" {
  source = "../../modules/cross-region-bucket"
  name = "selamnow-wal-archives"
  # Required for catastrophic recovery and replica seeding
}

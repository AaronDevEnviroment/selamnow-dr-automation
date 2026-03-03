# Incident Classification Model

SelamNow implements a 4-level incident model to direct recovery actions and map against RTO/RPO expectations.

### Level 1 — Node Failure
- **Definition:** Loss of a single compute node or isolated database replica.
- **Action:** Handled automatically via Kubernetes self-healing and database replica re-election.
- **Impact:** Negligible.

### Level 2 — Zone Failure
- **Definition:** Loss of an entire Availability Zone (AZ) within a region.
- **Action:** Cluster rebalancing within region. Multi-AZ deployment handles traffic shifting.
- **Impact:** Degraded performance, zero data loss.

### Level 3 — Regional Failure
- **Definition:** Unrecoverable loss of the Primary Region.
- **Action:** Trigger GitOps promotion of the secondary (Hot Standby) region.
- **Impact:** RTO and RPO metrics apply as defined in the `RTO_RPO_MATRIX.md`. Orchestration required via `selamnow-dr-automation`.

### Level 4 — Catastrophic Loss
- **Definition:** Unrecoverable loss of Primary and Hot Standby infrastructures simultaneously, or severe data corruption.
- **Action:** Restore from off-region snapshot + WAL replay.
- **Impact:** RTO applies maximum allowed operational limits. Extensive manual/GitOps coordination.

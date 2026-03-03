# Change Control Policy

Any structural modification to the disaster recovery control plane represents a material risk to SelamNow's Tier-1 operational survivability.

## 1. Zero-Trust Modification
- No single engineer may commit directly to the `main` branch.
- Modifying `ARCHITECTURE_LOCK.md`, `DR_POLICY.md`, or the `RTO_RPO_MATRIX.md` requires specialized board-level review context.

## 2. PR Validation Requirements
All merge requests modifying `terraform/` or `scripts/` MUST execute the following checks before merge approval:
- Static analysis of Terraform configurations.
- Dry-run validation of the failover scripts.
- Review by both a Lead SRE and a Governance/Compliance Officer.

## 3. Incident State Transitions
When an incident is declared:
1. A specific `dr-event-YYYYMMDD` branch MUST be created.
2. Changes within this branch are expedited but remain strictly documented.
3. The merge of this branch constitutes the organizational command to execute failover via GitOps agents.

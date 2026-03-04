# 🏛 SELAMNOW DR AUTOMATION — CONSTITUTION v1.0

---

## Financial Control Hooks (Mandatory)
This repository implements the following Tier-1 financial controls as defined in the [Financial Control Framework](file:///d:/AITProjects/selamnow-governance-control-plane/docs/FINANCIAL_CONTROL_FRAMEWORK.md):

- **Backup Automation:** Mandatory daily immutable backups of all financial databases.
- **Failover Orchestration:** Automated recovery of the financial kernel in secondary regions.
- **Data Recovery Integrity:** Validation of database checksums and consistency post-restore.
- **Disaster Simulation:** Periodic automated testing of the full system recovery path.

---

`selamnow-dr-automation` is the centralized disaster recovery orchestration and failover control plane for all SelamNow Tier-1 services.

It enforces:
- Multi-region replication posture
- GitOps-only failover execution
- RTO/RPO compliance guarantees
- Infrastructure immutability during incident response

**This repository does NOT deploy business logic. It controls infrastructure survivability.**

## 🎯 RTO / RPO Institutional Targets
| Infrastructure Layer | RTO | RPO |
| :--- | :--- | :--- |
| Core Platform (Ledgers) | < 30 Minutes | < 5 Minutes |
| Identity Service (Access) | < 15 Minutes | < 1 Minute |
| Payment Hub (Clearing) | < 20 Minutes | < 2 Minutes |
| Observability (Logs/Audits) | < 1 Hour | < 15 Minutes |

These are non-negotiable Tier-1 thresholds.

## 🏗 Repository Structure
- `ARCHITECTURE_LOCK.md`: The absolute, unalterable architectural Constitution.
- `DR_POLICY.md`: Institutional Disaster Recovery Policy.
- `RTO_RPO_MATRIX.md`: RTO and RPO Institutional Targets.
- `FAILOVER_RUNBOOK.md`: Operational Failover Runbook.
- `INCIDENT_CLASSIFICATION.md`: Incident Classification Model.
- `GITOPS_ENFORCEMENT_POLICY.md`: GitOps Enforcement Policy.
- `terraform/`: Infrastructure modules for primary, secondary, and cross-region replication.
- `argocd/`: Application definitions for repointing workloads.
- `scripts/`: DR measurement, compliance, and simulation tools.
- `compliance/`: Regulatory mapping and test reports.

## 🏁 Final Institutional Declaration
SelamNow Disaster Recovery Automation enforces multi-region, GitOps-governed failover orchestration with defined RTO/RPO thresholds, immutable infrastructure state control, and regulator-auditable recovery validation aligned with Basel operational resilience standards.

**This is not DevOps. It is a Banking Operational Resilience Control Plane.**

# RTO and RPO Institutional Targets

The following RTO (Recovery Time Objective) and RPO (Recovery Point Objective) thresholds are **non-negotiable Tier-1 commitments** for SelamNow’s infrastructure layers.

| Infrastructure Layer | RTO | RPO |
| :--- | :--- | :--- |
| **Core Platform (Ledgers)** | < 30 Minutes | < 5 Minutes |
| **Identity Service (Access)** | < 15 Minutes | < 1 Minute |
| **Payment Hub (Clearing)** | < 20 Minutes | < 2 Minutes |
| **Observability (Logs/Audits)** | < 1 Hour | < 15 Minutes |

## Enforcement
- All simulated and actual failovers MUST be measured against these targets.
- Any architectural change or update that increases recovery time beyond these thresholds is immediately rejected.
- Monitoring mechanisms must alert if replication lag (potential RPO) violates these thresholds.

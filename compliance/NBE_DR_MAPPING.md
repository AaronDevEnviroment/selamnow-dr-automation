# NBE Disaster Recovery Compliance Mapping

**Purpose:** To map SelamNow's disaster recovery automation repository to the National Bank of Ethiopia (NBE) operational risk and business continuity mandates.

## Mapping Table

| NBE Directive/Article | SelamNow Control Mechanism | Audit Proof Location |
| :--- | :--- | :--- |
| **Data Replication & Survivability** | Streaming + Logical WAL Archiving to cross-region storage. | `terraform/replication` |
| **Recovery Time Objective** | Core: 30m, Identity: 15m, Payments: 20m. | `RTO_RPO_MATRIX.md` |
| **Recovery Point Objective** | Core: 5m, Identity: 1m, Payments: 2m. | `RTO_RPO_MATRIX.md` |
| **Change Management during Failover** | Strictly GitOps. No manual server manipulation permitted. | `GITOPS_ENFORCEMENT_POLICY.md` |
| **Mandatory Testing** | Quarterly automated tests simulating multi-region failure. | `compliance/DR_TEST_REPORT_TEMPLATE.md` (Filled) |
| **Audit Trails & Logs** | Immutable Git history and commit triggers. | Repository Commit History |

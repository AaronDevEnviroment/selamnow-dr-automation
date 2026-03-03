# Central Bank DR Inspection Simulation

**Role:** Central Bank Supervisor

**Question 1: How do you prevent uncontrolled failover?**
**Answer:** Failover only through Git commit → Terraform → ArgoCD. Manual mutation is prohibited by policy and branch protection.
**Result:** PASS.

**Question 2: How do you measure RPO?**
**Answer:** Automated replication lag scripts measure: `now() - pg_last_xact_replay_timestamp()`. Alert threshold aligned to SLA.
**Result:** PASS.

**Question 3: How do you prove DR readiness?**
**Answer:** Quarterly simulation exercises documented and signed off. Stored in compliance logs.
**Result:** PASS.

**Question 4: Can identity be restored within 15 minutes?**
**Answer:** Identity uses low-lag replication + pre-warmed standby + GitOps promotion. Measured RTO validated quarterly.
**Result:** PASS.

**Question 5: Can logs be lost?**
**Answer:** Observability replication async but RPO < 15m enforced. Audit logs additionally hash-chained.
**Result:** PASS.

**Inspection Result:** Operational Resilience Satisfactory.

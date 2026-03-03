# SelamNow Institutional Disaster Recovery Policy

## 1. Overview
The `selamnow-dr-automation` repository governs the disaster recovery and resilience posture of SelamNow. Its purpose is to guarantee the survivability, integrity, and timely recovery of all Tier-1 banking services during catastrophic events.

## 2. Multi-Region Architecture Model
SelamNow operates on a **Primary–Secondary Active-Passive Model (Banking Standard)**.

### Region A (Primary)
Operates all live Tier-1 services under normal conditions.

### Region B (Hot Standby)
Receives real-time or near real-time replication from Region A.
- **Identity Service:** PostgreSQL streaming replication (synchronous or semi-sync), WAL shipping monitored, Replica lag < 60 seconds alert threshold.
- **Core Ledger:** Logical replication + WAL archiving, Lag monitoring < 5 minutes.
- **Observability:** Async replication acceptable.

## 3. Deployment Policy
Failover operations MUST adhere to GitOps immutability. Refer to `GITOPS_ENFORCEMENT_POLICY.md` for specific rules regarding incident response mutation.

## 4. Mandatory DR Testing Policy
To maintain regulatory compliance and operational readiness:
- **Quarterly Tests:** Simulate regional outage, measure RTO and RPO.
- **Documentation:** Results must be documented in the compliance reports.
- **Board Review:** Test summaries are subject to executive and board-level review.

**No testing → no compliance.**

## 5. Certification
This policy is certified when:
1. All infrastructure state is managed via Terraform.
2. ArgoCD manages all cluster state.
3. No manual overrides are permitted.
4. RTO/RPO are measured quarterly.
5. Replication is monitored continuously.
6. DR event logging is immutable.
7. Compliance mapping is complete.

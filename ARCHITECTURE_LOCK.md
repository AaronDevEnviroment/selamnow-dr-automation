# SelamNow DR Automation — Architecture Lock
## System Role: Disaster Recovery Control Plane

This document is the absolute, unalterable architectural Constitution for `selamnow-dr-automation`.
This repository is the centralized disaster recovery orchestration and failover control plane for all SelamNow Tier-1 services.

**IT IS NOT DEVOPS TOOLING.**
**IT IS BANKING CONTINUITY INFRASTRUCTURE GOVERNANCE.**

### 1. Mandatory Core Principles

1.  **Multi-region replication posture:** Enforces Active-Passive architecture across primary and secondary regions.
2.  **GitOps-only failover execution:** All recovery states MUST be orchestrated through code.
3.  **RTO/RPO compliance guarantees:** Enforces strict timing constraints per service tier.
4.  **Infrastructure immutability during incident response:** Prevents manual configuration drift during critical events.

### 2. What Belongs Here
- Terraform modules orchestrating regional failover infrastructure.
- ArgoCD application definitions repointing workloads to secondary clusters.
- DR measurement, compliance, and simulation scripts.

### 3. What is Strictly Forbidden
- **No business logic:** Application source code does not belong here.
- **No manual failover:** Direct terminal commands (`kubectl promote`, direct DB commands) to manage primary-standby are banned. See the GitOps Enforcement Policy.
- **No deployment pipelines for services:** This repository controls *where* things run, not *how* they are built.

This is the final lock. No deviations are allowed.

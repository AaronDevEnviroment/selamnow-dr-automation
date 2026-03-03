# SelamNow Operational Resilience Whitepaper
**Tier-1 Sovereign Infrastructure Standard**

## 1. Executive Summary
SelamNow operates under a sovereign-grade operational resilience architecture designed to meet Tier-1 banking continuity standards.
The architecture enforces multi-region replication, GitOps-governed failover, immutable infrastructure state, defined RTO/RPO targets, continuous replication monitoring, cryptographically verifiable audit trails, quarterly failover testing, and Basel-aligned operational risk controls. No manual intervention is permitted during disaster recovery.

## 2. Architectural Overview
SelamNow components (Core Platform, Identity Service, Payment Hub, Observability) are deployed in Region A (Primary) and Region B (Hot Standby). Replication is continuous, and failover is strictly GitOps-controlled.

## 3. RTO / RPO Targets (Authoritative)
| Component | RTO | RPO |
| :--- | :--- | :--- |
| Core Ledger | < 30 min | < 5 min |
| Identity | < 15 min | < 1 min |
| Payment Hub | < 20 min | < 2 min |
| Observability | < 60 min | < 15 min |
These are enforced through automated lag measurement and failover simulations.

## 4. GitOps Enforcement Doctrine
All infrastructure state is controlled by Terraform and ArgoCD. Manual changes (`kubectl` mutations, SSH fixes, console toggles, manual DB promotion) are prohibited. Recovery must originate from a Git commit, guaranteeing traceability, non-repudiation, and auditability.

## 5. Replication Model
- **Identity:** Synchronous or semi-sync PostgreSQL Streaming Replication.
- **Ledger:** WAL-based replication.
- **Payment Hub:** Low-lag async replication.
- **Observability:** Async acceptable.
Replication lag is continuously monitored. RPO violations trigger alerts and CI failure.

## 6. Failover Workflow (Controlled Sequence)
1. Incident detected.
2. DR branch created in Git.
3. Terraform promotes standby region.
4. ArgoCD re-targets workloads.
5. Health checks validated.
6. RTO and RPO measured.
7. DR report committed.

## 7. Basel Alignment
SelamNow aligns with Basel III Operational Risk Framework, Business Continuity Management principles, supervisory resilience mandates, and ICT risk governance controls, satisfying recovery capability, data preservation, regional survivability, and documented test exercises.

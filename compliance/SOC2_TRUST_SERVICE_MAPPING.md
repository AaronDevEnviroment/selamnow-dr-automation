# SOC 2 Type II Trust Services Criteria

SelamNow is designed to satisfy the rigorous evidence and operational requirements set forth by SOC 2 for Service Organizations.

## Trust Principles Mapping

### 1. Security
**Protection of system resources against unauthorized access.**
- OPA Policy-as-Code engines structurally restrict all internal cluster behaviors.
- Identity Service acts as the single source of truth.
- RBAC is strongly bound to service accounts, removing human intervention.

### 2. Availability
**Accessibility of the system for operation and use.**
- Multi-region DR orchestration via `selamnow-dr-automation`.
- Automated health-based traffic routing and continuous GitOps application failover via ArgoCD.
- Measured and strictly limited Recovery Time Objectives (RTO).

### 3. Processing Integrity
**System processing is complete, valid, accurate, timely, and authorized.**
- Core Platform ledger is event-sourced and append-only.
- Idempotency keys are mandatory for all transactions routed through the Payment Hub to prevent duplicate clearing.
- Cryptographic hash-chaining prevents retroactive tampering of financial states.

### 4. Confidentiality
**Information designated as confidential is protected.**
- mTLS Service-Mesh enforces encryption in transit between all intra-cluster microservices.
- Cross-region replication streams are encrypted via verified TLS channels.

### 5. Privacy
**Personal information is collected, used, retained, disclosed, and disposed of properly.**
- Strong tenancy and role isolation enforced by Identity tokens and OPA constraints.
- Regulators have dedicated Break-Glass and Federation Trust access without needing raw customer credentials.

*Quarterly collection of the Git audit logs, CI run status, and Terraform state constitutes the evidence for SOC 2 Type II reports.*

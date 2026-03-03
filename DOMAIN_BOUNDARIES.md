# Domain Boundaries

The `selamnow-dr-automation` repository is bounded strictly to the infrastructure provisioning and traffic redirection logic during disaster recovery events.

## In-Scope
- Orchestration of Multi-region active-passive failure transitions.
- RTO and RPO automated measurement and validation operations.
- GitOps deployment state shifts for cross-region clusters (ArgoCD target adjustments).
- Continuous replication health checks across PostgreSQL clusters.

## Out-of-Scope
- Business logic or service application code.
- Day-to-Day feature deployment pipelines.
- Standard continuous delivery artifacts.
- Business monitoring or application metric capturing (managed by Observability).

This boundary is absolute to prevent contamination of recovery processes with standard application delivery mechanisms.

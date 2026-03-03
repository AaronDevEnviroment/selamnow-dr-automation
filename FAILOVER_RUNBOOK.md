# Operational Failover Runbook (Strict Sequence)

During an active incident categorized as Level 3 (Regional Failure) or Level 4 (Catastrophic Loss), the following Git-traceable sequence MUST be followed exactly.

## 1. Incident Declaration
1. Incident is formally detected and assessed.
2. Declare the DR event in Git by creating a new failover branch: `dr-event-YYYYMMDD`.

## 2. Infrastructure Promotion
1. Verify Primary region is explicitly isolated to prevent split-brain.
2. Execute Terraform promotion of the standby region.
   ```bash
   # Conceptually: Apply the Terraform state defining the Secondary as Active
   terraform plan -var-file="dr_active.tfvars"
   terraform apply -var-file="dr_active.tfvars" -auto-approve
   ```

## 3. Workload Repointing
1. ArgoCD re-points service targets to the promoted cluster.
2. Merge the ArgoCD state transition to the main branch if DR branch is evaluated.

## 4. Verification
1. Confirm health checks on the secondary region.
2. Verify dependent services (Database, Messaging) are active and rejecting writes to the old primary.

## 5. Compliance Recording
1. Measure actual RTO from incident occurrence to health check passing.
2. Record RPO lag prior to the event (via observability metrics).
3. Commit the DR report to the `compliance/` directory for audit.

All actions must be Git-traceable. No manual promotion is permitted under any circumstances.

# Branch Protection Policy

This defines the immutable protection mechanisms applied to the `main` branch of the `selamnow-dr-automation` repository.

## 1. Branch Rules (`main`)
- **Direct Commits:** DISABLED. No exceptions.
- **Pull Request Required:** YES. All changes must originate from a branch.
- **Approvals Required:** 2 (Minimum 1 Lead SRE / Infrastructure Architect).
- **Stale Reviews:** Dismissed when new commits are pushed.

## 2. Required Status Checks
Before a PR can be merged into `main`, the following automated CI gates must pass:
- `tf-validate`: Terraform static analysis and syntax verification.
- `shellcheck`: Validation of all replication and recovery shell scripts.
- `dr-dry-run`: Simulation of the promotion variables without execution.

## 3. Administrator Override
- **Bypass Protections:** DISABLED for all roles, including organization administrators.
- To execute an active disaster failover, the structured GitOps event branch (`dr-event-*`) process must be followed.

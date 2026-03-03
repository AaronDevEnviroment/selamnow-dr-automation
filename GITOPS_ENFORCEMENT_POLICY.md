# GitOps Enforcement Policy

## Rule: GitOps-Only Failover

No manual infrastructure mutation is allowed during recovery. This is a strict operational resilience control.

**Strictly Banned Actions During Incidents:**
- ❌ No `kubectl edit` or imperative patching.
- ❌ No direct database `promote` commands executed by humans.
- ❌ No manual scaling adjustments via console.
- ❌ No emergency SSH modifications to production nodes.
- ❌ No cloud console toggles (e.g., DNS switches via web UI).

## The Enforcement Principle
All failover state transitions MUST occur through:
1. **Terraform plan/apply:** Orchestrated via CI workflows or authorized automation.
2. **ArgoCD promotion:** Application deployment states synced declarative to the new region.
3. **Git commit-triggered state transition:** The absolute source of truth.

**If it cannot be executed via Git commit → it is not permitted.**
This policy exists to prevent uncontrolled divergence during high-stress disaster events, ensuring predictable, auditable recovery.

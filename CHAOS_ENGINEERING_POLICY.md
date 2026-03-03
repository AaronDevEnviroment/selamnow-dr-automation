# Chaos Engineering Policy

As a Tier-1 Modern Digital Bank, SelamNow requires continuous resilience testing to ensure systems are battle-ready and failure modes are deterministic.

## Quarterly Chaos Operations
The following simulations must be executed and logged on a quarterly basis:

### 1. Region Shutdown Simulation
- **Target:** Primary Active Region.
- **Action:** Full simulated blackout of the primary Kubernetes cluster ingress.
- **Validation:** Automatic routing shift to Region B within defined RTO. 

### 2. Database Replication Delay Injection
- **Target:** PostgreSQL Streaming Replication.
- **Action:** Inject artificial network latency to exceed the RPO threshold of < 1 minute for the Identity service.
- **Validation:** Alerting systems successfully fire, CI gates block merges, and metrics correctly reflect the breach.

### 3. Identity Surge Simulation
- **Target:** Identity Service pods.
- **Action:** Simulate 10x normal authentication traffic (Thundering Herd).
- **Validation:** Rate limiters engage, Edge WAF blocks excessive thresholds, auto-scaling provisions nodes correctly without database connection exhaustion.

### 4. Payment Congestion Test
- **Target:** Payment Hub processing queue.
- **Action:** Block clearing egress channels temporarily.
- **Validation:** Payment transactions are buffered securely on the event-sourced ledger without duplication or loss once processing resumes.

*All chaos experiments must be run using automated scripts, with the results immutably documented in `QUARTERLY_DR_EXERCISE_LOG.md`.*

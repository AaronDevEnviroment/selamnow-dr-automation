# ISO 27001 Control Mapping

SelamNow Operational Resilience Control Plane directly facilitates compliance with the ISO/IEC 27001 standard.

## Control Mapping Status
| ISO Control | Description | SelamNow Implementation | Status |
| :--- | :--- | :--- | :--- |
| **A.12.1.3** | Capacity Management | Multi-region active-passive provisioning. | ALIGNED |
| **A.12.3.1** | Information Backup | PostgreSQL Streaming Replication & WAL Archiving to cross-region object storage. | ALIGNED |
| **A.16.1.1** | Incident Mgmt | DR runbook and `dr-event-*` Git branches explicitly orchestrate disaster responses. | ALIGNED |
| **A.17.1.2** | Availability | Strict RTO/RPO measurement validated via automated scripts. Failover execution. | ALIGNED |
| **A.9.1.1** | Access Control Policy | Identity Service acts as the sovereign control, strictly defining access logic. | ALIGNED |
| **A.9.2.3** | Mgmt of Privileged Rights | GitOps + Branch Protection blocks any singular human from executing failovers. | ALIGNED |
| **A.14.2.5** | Secure System Eng | CI pipelines enforce governance checks, Terraform validation, and script linting prior to merge. | ALIGNED |

*SelamNow achieves structural alignment with ISO 27001. Final certification requires procedural audit evidence collected quarterly.*

#!/bin/bash
# validate-replication.sh
# SelamNow DR Automation - Real-Time Replication Validator
# Enforced per service threshold.

echo "[INFO] Validating Primary -> Standby replication lag..."

lag=$(psql -t -c "SELECT EXTRACT(EPOCH FROM now() - pg_last_xact_replay_timestamp());")

if (( $(echo "$lag > 60" | bc -l) )); then
  echo "RPO threshold exceeded."
  exit 1
fi

echo "Replication is within RPO threshold limits."
exit 0

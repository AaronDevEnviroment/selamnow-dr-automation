#!/bin/bash
# measure-rto.sh
# SelamNow DR Automation - RTO Measurement Tool
# Automatically calculates total Recovery Time during failovers.

set -euo pipefail

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <start_timestamp> <end_timestamp>"
    echo "Example: $0 1712918239 1712919342"
    exit 1
fi

START_TS=$1
END_TS=$2

RTO_SECONDS=$((END_TS - START_TS))
RTO_MINUTES=$(echo "scale=2; $RTO_SECONDS / 60" | bc)

echo "[DATA] Measured RTO: $RTO_SECONDS seconds ($RTO_MINUTES minutes)"

# 30 minutes = 1800 seconds
if [ "$RTO_SECONDS" -gt 1800 ]; then
    echo "[WARNING] RTO EXCEEDS 30-MINUTE THRESHOLD."
    exit 1
else
    echo "[PASS] Setup meets Tier-1 RTO validation."
    exit 0
fi

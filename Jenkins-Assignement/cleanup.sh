#!/bin/bash

THRESHOLD=10G
USAGE=$(du -sh /var/lib/jenkins | cut -f1)

echo "Current usage: $USAGE"

rm -rf /var/lib/jenkins/jobs/*/builds/*
echo "Cleanup completed"

#!/bin/sh
set -e

# AWS CLI automatically uses these env vars:
# - AWS_ACCESS_KEY_ID
# - AWS_SECRET_ACCESS_KEY
# - AWS_DEFAULT_REGION (or AWS_REGION)

aws ecs run-task \
  --cluster gpu-workflow-cluster \
  --task-definition maestro-gpu-task-definition \
  --capacity-provider-strategy capacityProvider=Infra-ECS-Cluster-gpu-workflow-cluster-a2f71c58-ManagedInstancesCapacityProvider-YXXek0PTYGng,weight=1 \
  --network-configuration "awsvpcConfiguration={subnets=[subnet-061e01d7a891c4fbd],securityGroups=[sg-0f875cb7e3b451f0c]}"
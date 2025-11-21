#!/bin/sh
set -e

# Validate environment variable
if [ -z "$OUTPUT_DIR" ]; then
  echo "ERROR: OUTPUT_DIR must be set"
  exit 1
fi

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Create a file with content
echo "Hello World from ECS Task Runner!" > "$OUTPUT_DIR/hello.txt"
echo "Created file at: $OUTPUT_DIR/hello.txt"

# Run the ECS task
echo "Starting ECS task..."
aws ecs run-task \
  --cluster gpu-workflow-cluster \
  --task-definition maestro-gpu-task-definition \
  --capacity-provider-strategy capacityProvider=Infra-ECS-Cluster-gpu-workflow-cluster-a2f71c58-ManagedInstancesCapacityProvider-YXXek0PTYGng,weight=1 \
  --network-configuration "awsvpcConfiguration={subnets=[subnet-061e01d7a891c4fbd],securityGroups=[sg-0f875cb7e3b451f0c]}"
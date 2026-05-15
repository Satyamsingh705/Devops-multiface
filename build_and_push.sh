#!/usr/bin/env bash
set -euo pipefail

# Usage: ./build_and_push.sh <dockerhub-username/repo> [tag]
# Example: ./build_and_push.sh satyamkumar/ams latest

IMAGE="${1:-}"
TAG="${2:-latest}"

if [ -z "$IMAGE" ]; then
  echo "Error: image name required (e.g. username/ams)"
  echo "Usage: $0 <dockerhub-username/repo> [tag]"
  exit 1
fi

# Login if creds are present in env
if [ -n "${DOCKERHUB_USERNAME:-}" ] && [ -n "${DOCKERHUB_PASSWORD:-}" ]; then
  echo "Logging in to Docker Hub as ${DOCKERHUB_USERNAME}"
  echo "${DOCKERHUB_PASSWORD}" | docker login --username "${DOCKERHUB_USERNAME}" --password-stdin
fi

FULL_TAG="${IMAGE}:${TAG}"

echo "Building ${FULL_TAG}..."
docker build -t "${FULL_TAG}" .

echo "Pushing ${FULL_TAG}..."
docker push "${FULL_TAG}"

echo "Done: ${FULL_TAG}" 

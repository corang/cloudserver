#!/bin/bash
REPO="$(yq .repo upstream.yaml)"

TAG="$(yq .tag upstream.yaml)"

echo "Pulling $REPO:$TAG"

git clone --branch "$TAG" --depth 1 "$REPO" upstream
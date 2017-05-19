#!/usr/bin/env bash
# Usage: db <NAME>|<NAME>:<VERSION>
# An optional .dockerinfo file follows the KEY=value pattern
# If NAME is defined in .dockerinfo, it will be used for the name of the image
# VERSION defaults to the current git branch

# shellcheck disable=SC1091
[[ -f ./.dockerinfo ]] && source ./.dockerinfo
IFS=':' read -r PARTS <<< "$1"
BRANCH="$(git rev-parse --abbrev-ref HEAD)"
COMMIT="$(git rev-parse --short HEAD)"
DIRNAME="${PWD##*/}"
DEFAULT_NAME="${NAME:-$DIRNAME}"
DEFAULT_VERSION="${VERSION:-$BRANCH}"
NAME="${PARTS[0]:-$DEFAULT_NAME}"
VERSION="${PARTS[1]:-$DEFAULT_VERSION}"
IMAGE_NAME="${NAME}:${VERSION}"
CONTAINER_NAME="${NAME}-${COMMIT}"
export BRANCH
export COMMIT
export NAME
export VERSION
export IMAGE_NAME
export CONTAINER_NAME
# echo "$PARTS"
# echo "$BRANCH"
# echo "$NAME"
# echo "$VERSION"
# echo "${IMAGE_NAME}"
# echo "${CONTAINER_NAME}"

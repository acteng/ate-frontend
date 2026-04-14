#!/bin/bash

set -eo pipefail

REPO_DIR=$(git rev-parse --show-toplevel)

# favicon.svg
cp "${REPO_DIR}/node_modules/govuk-frontend/dist/govuk/assets/images/favicon.svg" \
	"${REPO_DIR}/src/ate/assets/ate-icons/favicon.svg"
git apply ${REPO_DIR}/src/ate/assets/ate-icons/*.patch

#!/bin/bash

set -eo pipefail

REPO_DIR=$(git rev-parse --show-toplevel)
UPSTREAM_DIR=${REPO_DIR}/node_modules/govuk-frontend/dist/govuk/components/footer
COMPONENT_DIR=${REPO_DIR}/src/ate/components/ate-footer

cp ${UPSTREAM_DIR}/template.njk ${COMPONENT_DIR}/template.njk
git apply ${COMPONENT_DIR}/*.patch

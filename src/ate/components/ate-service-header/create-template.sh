#!/bin/bash

set -eo pipefail

REPO_DIR=$(git rev-parse --show-toplevel)
UPSTREAM_DIR=${REPO_DIR}/node_modules/@govuk-one-login/service-header/dist/nunjucks/service-header
COMPONENT_DIR=${REPO_DIR}/src/ate/components/ate-service-header

cp ${UPSTREAM_DIR}/template.njk ${COMPONENT_DIR}/template.njk
git apply ${COMPONENT_DIR}/*.patch

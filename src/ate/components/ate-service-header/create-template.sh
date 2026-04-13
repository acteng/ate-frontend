#!/bin/bash

set -eo pipefail

REPO_DIR=$(git rev-parse --show-toplevel)
SOURCE_DIR=${REPO_DIR}/node_modules/@govuk-one-login/service-header/dist/nunjucks/service-header
TARGET_DIR=${REPO_DIR}/src/ate/components/ate-service-header

cp ${SOURCE_DIR}/template.njk ${TARGET_DIR}/template.njk
git apply ${TARGET_DIR}/*.patch

#!/bin/bash

set -eo pipefail

REPO_DIR=$(git rev-parse --show-toplevel)
SOURCE_DIR=${REPO_DIR}/node_modules/govuk-frontend/dist/govuk/components/header
TARGET_DIR=${REPO_DIR}/src/ate/components/ate-header

cp ${SOURCE_DIR}/template.njk ${TARGET_DIR}/template.njk
git apply ${TARGET_DIR}/*.patch

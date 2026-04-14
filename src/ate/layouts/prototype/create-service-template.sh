#!/bin/bash

set -eo pipefail

REPO_DIR=$(git rev-parse --show-toplevel)
SOURCE_DIR=${REPO_DIR}/node_modules/@govuk-one-login/service-header/dist/nunjucks/service-header/layouts
TARGET_DIR=${REPO_DIR}/src/ate/layouts/prototype

cp ${SOURCE_DIR}/service-header.njk ${TARGET_DIR}/service-template.njk
git apply ${TARGET_DIR}/*.patch

#!/bin/bash

set -eo pipefail

REPO_DIR=$(git rev-parse --show-toplevel)

create_template() {
	local SOURCE_PATH=$1
	local TARGET_PATH=$2
	local PATCH_PATH=$3

	cp "${REPO_DIR}/${SOURCE_PATH}" "${REPO_DIR}/${TARGET_PATH}"
	git apply ${REPO_DIR}/${PATCH_PATH}
}

# ATE header component
create_template \
	"node_modules/govuk-frontend/dist/govuk/components/header/template.njk" \
	"src/ate/components/ate-header/template.njk" \
	"src/ate/components/ate-header/*.patch"

# ATE footer component
create_template \
	"node_modules/govuk-frontend/dist/govuk/components/footer/template.njk" \
	"src/ate/components/ate-footer/template.njk" \
	"src/ate/components/ate-footer/*.patch"

# ATE service header component
create_template \
	"node_modules/@govuk-one-login/service-header/dist/nunjucks/service-header/template.njk" \
	"src/ate/components/ate-service-header/template.njk" \
	"src/ate/components/ate-service-header/*.patch"

# ATE service template layout
create_template \
	"node_modules/@govuk-one-login/service-header/dist/nunjucks/service-header/layouts/service-header.njk" \
	"src/ate/layouts/prototype/service-template.njk" \
	"src/ate/layouts/prototype/*.patch"

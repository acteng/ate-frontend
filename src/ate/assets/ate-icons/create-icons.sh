#!/bin/bash

set -eo pipefail

REPO_DIR=$(git rev-parse --show-toplevel)

# favicon.svg
cp "${REPO_DIR}/node_modules/govuk-frontend/dist/govuk/assets/images/favicon.svg" \
	"${REPO_DIR}/src/ate/assets/ate-icons/favicon.svg"
git apply ${REPO_DIR}/src/ate/assets/ate-icons/*.patch

# favicon.ico
inkscape -w 16 -h 16 -o favicon-16.png favicon.svg
inkscape -w 32 -h 32 -o favicon-32.png favicon.svg
inkscape -w 48 -h 48 -o favicon-48.png favicon.svg
convert \
	\( favicon-16.png -colors 16 \) \
	\( favicon-32.png -colors 32 \) \
	\( favicon-48.png -colors 32 \) \
	favicon.ico
rm favicon-16.png favicon-32.png favicon-48.png

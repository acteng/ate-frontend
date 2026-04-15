#!/bin/bash

set -eo pipefail

REPO_DIR=$(git rev-parse --show-toplevel)
SOURCE_DIR="${REPO_DIR}/node_modules/govuk-frontend/dist/govuk/assets/images"
TARGET_DIR="${REPO_DIR}/src/ate/assets/ate-icons"

# favicon.svg
cp "${SOURCE_DIR}/favicon.svg" "${TARGET_DIR}/favicon.svg"
git apply ${TARGET_DIR}/*.patch

# favicon.ico
inkscape -w 16 -h 16 -o "${TARGET_DIR}/favicon-16.png" "${TARGET_DIR}/favicon.svg"
inkscape -w 32 -h 32 -o "${TARGET_DIR}/favicon-32.png" "${TARGET_DIR}/favicon.svg"
inkscape -w 48 -h 48 -o "${TARGET_DIR}/favicon-48.png" "${TARGET_DIR}/favicon.svg"
convert \
	\( "${TARGET_DIR}/favicon-16.png" -colors 16 \) \
	\( "${TARGET_DIR}/favicon-32.png" -colors 32 \) \
	\( "${TARGET_DIR}/favicon-48.png" -colors 32 \) \
	"${TARGET_DIR}/favicon.ico"
rm "${TARGET_DIR}/favicon-16.png" "${TARGET_DIR}/favicon-32.png" "${TARGET_DIR}/favicon-48.png"

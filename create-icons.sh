#!/bin/bash

set -eo pipefail

REPO_DIR=$(git rev-parse --show-toplevel)
SOURCE_DIR="${REPO_DIR}/node_modules/govuk-frontend/dist/govuk/assets"
TARGET_DIR="${REPO_DIR}/src/ate/assets/ate-icons"

# GOV.UK Primary blue
SOURCE_COLOUR="#1D70B8"
# DfT organisation colour
TARGET_COLOUR="#006853"

# favicon.svg
cp "${SOURCE_DIR}/images/favicon.svg" "${TARGET_DIR}/favicon.svg"
sed -i "s/${SOURCE_COLOUR}/${TARGET_COLOUR}/g" "${TARGET_DIR}/favicon.svg"

# favicon.ico
convert \
	\( <(inkscape -w 16 -h 16 --export-type=png -o - "${TARGET_DIR}/favicon.svg") -colors 16 \) \
	\( <(inkscape -w 32 -h 32 --export-type=png -o - "${TARGET_DIR}/favicon.svg") -colors 32 \) \
	\( <(inkscape -w 48 -h 48 --export-type=png -o - "${TARGET_DIR}/favicon.svg") -colors 32 \) \
	"${TARGET_DIR}/favicon.ico"

# ate-icon-{180,192,512}.png
cp "${REPO_DIR}/design/govuk-frontend/govuk-icon.svg" "${TARGET_DIR}/ate-icon.svg"
sed -i "s/${SOURCE_COLOUR}/${TARGET_COLOUR}/g" "${TARGET_DIR}/ate-icon.svg"
for SIZE in 180 192 512
do
	inkscape -w "${SIZE}" -h "${SIZE}" -o "${TARGET_DIR}/ate-icon-${SIZE}.png" "${TARGET_DIR}/ate-icon.svg"
done
rm "${TARGET_DIR}/ate-icon.svg"

# ate-icon-mask.svg
cp "${SOURCE_DIR}/images/govuk-icon-mask.svg" "${TARGET_DIR}/ate-icon-mask.svg"

# manifest.json
cp "${SOURCE_DIR}/manifest.json" "${TARGET_DIR}/manifest.json"
git apply ${TARGET_DIR}/*.patch

# Maintenance

## Upgrading GOV.UK Frontend

Upgrade GOV.UK Frontend in:

* [package.json](../package.json)
* [govuk-prototype-kit.config.json](../govuk-prototype-kit.config.json)

### Icons

We derive the ATE icons from the GOV.UK icons.

Update the icons after upgrading GOV.UK Frontend:

```bash
./create-icons.sh
```

Requires [Inkscape](https://inkscape.org/) and [ImageMagick](https://imagemagick.org/) to be installed.

### Templates

We derive the following templates from GOV.UK Frontend:

* ATE header component - the [crown cannot be changed](https://github.com/alphagov/govuk-frontend/issues/1639) in the
  GOV.UK header, so we fork the template to replace it with the ATE logo
* ATE footer component - the [crown cannot be removed](https://github.com/alphagov/govuk-frontend/issues/5952) from the
  GOV.UK footer, so we fork the template to remove it

[Update the templates](#updating-the-templates) after upgrading GOV.UK Frontend.

## Upgrading GOV.UK One Login Service Header

Upgrade GOV.UK One Login Service Header in:

* [package.json](../package.json)
* [govuk-prototype-kit.config.json](../govuk-prototype-kit.config.json)

### Templates

We derive the following templates from GOV.UK One Login Service Header:

* ATE service header component - the [crown cannot be changed](https://github.com/govuk-one-login/service-header/issues/40)
  in the GOV.UK One Login Service Header, so we fork the template to replace it with the ATE logo
* ATE service template layout

[Update the templates](#updating-the-templates) after upgrading GOV.UK One Login Service Header.

## Updating the templates

To apply our patches to the upstream templates:

```bash
./create-templates.sh
```

If there are conflicts then the [patches will need to be recreated](#creating-patches).

## Creating patches

To create patches for a template:

1. Copy the upstream template and commit
1. Make a change and commit, repeating as necessary
1. Create patches from commit (1) using:
   ```bash
   git format-patch --zero-commit --no-numbered <commit>
   ```
1. Reset back to the commit before (1)

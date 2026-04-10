# Maintenance

## Upgrading GOV.UK Frontend

Upgrade GOV.UK Frontend in:

* [package.json](../package.json)
* [govuk-prototype-kit.config.json](../govuk-prototype-kit.config.json)

### GOV.UK header component

GOV.UK Frontend [doesn't allow the crown logo to be customised in the header](https://github.com/alphagov/govuk-frontend/issues/1639),
so we maintain a copy of the header template to replace it with the ATE logo.

After upgrading GOV.UK Frontend, update the header template:

```bash
./src/ate/components/ate-header/create-template.sh
```

### GOV.UK footer component

GOV.UK Frontend [doesn't allow the crown logo to be removed from the footer](https://github.com/alphagov/govuk-frontend/issues/5952),
so we maintain a copy of the footer template to remove it ourselves.

After upgrading GOV.UK Frontend, update the footer template:

```bash
./src/ate/components/ate-footer/create-template.sh
```

## Upgrading GOV.UK One Login Service Header

Upgrade GOV.UK One Login Service Header in:

* [package.json](../package.json)
* [govuk-prototype-kit.config.json](../govuk-prototype-kit.config.json)

GOV.UK One Login Service Header [doesn't allow the crown logo to be customised](https://github.com/govuk-one-login/service-header/issues/40),
so we maintain a copy of the template to replace it with the ATE logo.

After upgrading GOV.UK One Login Service Header, update the template:

```bash
./src/ate/components/ate-service-header/create-template.sh
```

## Creating patches

If there are conflicts when updating components then the patches will need to be recreated.

To create patches for a component:

1. Copy the upstream template and commit
1. Make a change and commit, repeating as necessary
1. Create patches from commit (1) using:
   ```bash
   git format-patch --zero-commit --no-numbered <commit>
   ```
1. Reset back to the commit before (1)

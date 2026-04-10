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

If there are conflicts then the patches will need to be recreated.

### Creating patches

To create patches for a component:

1. Copy the upstream template and commit
1. Make a change and commit, repeating as necessary
1. Create patches from commit (1) using `git format-patch --zero-commit --no-numbered <commit>`
1. Reset back to the commit before (1)

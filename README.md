# ATE Frontend

ATE templates and styles for the web.

## Compatibility

The following version matrix details the compatibility between this project and other frontend components:

| ATE Frontend       | GOV.UK Frontend | GOV.UK One Login Service Header     |
|--------------------|-----------------|-------------------------------------|
| 0.1.0 (unreleased) | 6.1.0           | 5.0.0 (uses GOV.UK Frontend 5.13.0) |

## Components

This project provides the following components.

### ATE header

The ATE header component tell users that they're using an ATE service. It replaces the GOV.UK logo in the GOV.UK header
with the ATE logo.

![Screenshot of the ATE header](docs/components/ate-header.png)

Use with the Nunjucks macro and the [GOV.UK header](https://design-system.service.gov.uk/components/header/) options:

```nunjucks
{% from "ate/components/ate-header/macro.njk" import ateHeader %}

{{ ateHeader({}) }}
```

### ATE footer

The ATE footer component provides copyright, licensing and other information about your service. It removes the GOV.UK
logo from the GOV.UK footer.

![Screenshot of the ATE footer](docs/components/ate-footer.png)

Use with the Nunjucks macro and the [GOV.UK footer](https://design-system.service.gov.uk/components/footer/) options:

```nunjucks
{% from "ate/components/ate-footer/macro.njk" import ateFooter %}

{{ ateFooter({}) }}
```

### ATE service header

The ATE service header component tell users that they're logged into an ATE service. It replaces the GOV.UK logo in the
GOV.UK One Login service header with the ATE logo.

![Screenshot of the ATE service header](docs/components/ate-service-header.png)

Use with the Nunjucks macro and the [GOV.UK One Login service header](https://github.com/govuk-one-login/service-header) options:

```nunjucks
{% from "ate/components/ate-service-header/macro.njk" import ateServiceHeader %}

{{ ateServiceHeader({}) }}
```

## Layouts

The following layouts can be used with the [GOV.UK Prototype Kit](https://prototype-kit.service.gov.uk/):

* `ate/layouts/prototype/template.njk` - uses the ATE header and footer
* `ate/layouts/prototype/service-template.njk` - uses the ATE service header and footer

## See also

* [Maintenance](docs/maintenance.md)

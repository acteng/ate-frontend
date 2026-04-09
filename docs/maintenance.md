# Maintenance

## Upgrading GOV.UK Frontend

Upgrade GOV.UK Frontend in:

* [package.json](../package.json)
* [govuk-prototype-kit.config.json](../govuk-prototype-kit.config.json)

### GOV.UK header component

GOV.UK Frontend [doesn't allow the crown logo to be customised in the header](https://github.com/alphagov/govuk-frontend/issues/1639),
so we maintain a copy of the header template to replace it with the ATE logo.

After upgrading GOV.UK Frontend, update the header template:

1. Copy the contents of the [GOV.UK header template](../node_modules/govuk-frontend/dist/govuk/components/header/template.njk)
   to the [ATE header template](../src/ate/components/ate-header/template.njk) and correct the imports by applying the
   following patch:

   ```diff
   -{% from "../../macros/attributes.njk" import govukAttributes -%}
   -{% from "../../macros/logo.njk" import govukLogo -%}
   +{% from "govuk/macros/attributes.njk" import govukAttributes -%}
   +{% from "govuk/macros/logo.njk" import govukLogo -%}
   ```

1. Replace the crown logo with the ATE logo by applying the following patch:

   ```diff
    {% from "govuk/macros/attributes.njk" import govukAttributes -%}
   -{% from "govuk/macros/logo.njk" import govukLogo -%}
   
    <div class="govuk-header {%- if params.classes %} {{ params.classes }}{% endif %}" {{- govukAttributes(params.attributes) }}>
      <div class="govuk-header__container {{ params.containerClasses | default("govuk-width-container", true) }}">
        <div class="govuk-header__logo">
          <a href="{{ params.homepageUrl | default("//gov.uk", true) }}" class="govuk-header__homepage-link">
   -        {{ govukLogo({
   -          classes: "govuk-header__logotype",
   -          ariaLabelText: "GOV.UK"
   -        }) | trim | indent(8) }}
   +        <img class="govuk-header__logotype ate-header__logotype" src="{{ params.assetPath }}/ate-header/ATE_Lesser_Arms_Landscape_White.png" alt="Active Travel England"/>
   +        <img class="govuk-header__logotype ate-header__logotype--focus" src="{{ params.assetPath }}/ate-header/ATE_Lesser_Arms_Landscape_Black.png" alt="Active Travel England"/>
            {% if (params.productName) %}
            <span class="govuk-header__product-name">
              {{- params.productName -}}
   ```

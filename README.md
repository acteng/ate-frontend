# ATE Frontend

Active Travel England templates and styles for digital services.

## Compatibility

The following version matrix details the compatibility between this project and other frontend components:

| ATE Frontend       | GOV.UK Frontend | GOV.UK One Login service header |
|--------------------|-----------------|---------------------------------|
| 0.1.0 (unreleased) | 6.1.0           | 6.0.0                           |

## Page template

The page template combines the boilerplate markup and components needed for a basic ATE page. It includes:

* everything from the [GOV.UK page template](https://design-system.service.gov.uk/styles/page-template/)
* the ATE favicon, and other related theme icons
* the [ATE header component](#ate-header) and [ATE footer component](#ate-footer)

Use in a Nunjuncks template:

```nunjucks
{% extends "ate/template.njk" %}
```

The template supports all the GOV.UK page template
[blocks and options](https://design-system.service.gov.uk/styles/page-template/#template-blocks-and-options).

## Components

This project provides the following components.

### ATE header

The ATE header component tell users that they're using an ATE service. It replaces the GOV.UK logo in the GOV.UK header
with the ATE logo.

![Screenshot of the ATE header](docs/components/ate-header.png)

Use with the Nunjucks macro:

```nunjucks
{% from "ate/components/ate-header/macro.njk" import ateHeader %}

{{ ateHeader({}) }}
```

The macro supports all the [GOV.UK header](https://design-system.service.gov.uk/components/header/) options, plus:

| Name        | Type   | Description                                |
|-------------|--------|--------------------------------------------|
| `assetPath` | string | Specify a path to the ATE Frontend assets. |

### ATE footer

The ATE footer component provides copyright, licensing and other information about your service. It removes the GOV.UK
logo from the GOV.UK footer.

![Screenshot of the ATE footer](docs/components/ate-footer.png)

Use with the Nunjucks macro:

```nunjucks
{% from "ate/components/ate-footer/macro.njk" import ateFooter %}

{{ ateFooter({}) }}
```

The macro supports all the [GOV.UK footer](https://design-system.service.gov.uk/components/footer/) options.

### ATE service header

The ATE service header component tell users that they're logged into an ATE service. It replaces the GOV.UK logo in the
GOV.UK One Login service header with the ATE logo.

![Screenshot of the ATE service header](docs/components/ate-service-header.png)

Use with the Nunjucks macro:

```nunjucks
{% from "ate/components/ate-service-header/macro.njk" import ateServiceHeader %}

{{ ateServiceHeader({}) }}
```

The macro supports all the [GOV.UK One Login service header](https://github.com/govuk-one-login/service-header) options,
plus:

| Name        | Type   | Description                                |
|-------------|--------|--------------------------------------------|
| `assetPath` | string | Specify a path to the ATE Frontend assets. |

## Using with Node.js

Install ATE Frontend to use the templates and styles in your Node.js project.

### Installing

Install ATE Frontend:

```bash
npm install @active-travel-england/ate-frontend
```

This will also install [GOV.UK Frontend](https://frontend.design-system.service.gov.uk/) and
[GOV.UK One Login service header](https://github.com/govuk-one-login/service-header) that are used by ATE Frontend.

### Configuring the templates

Configure [Nunjucks](https://mozilla.github.io/nunjucks/) to find the components by adding the template paths:

```javascript
nunjucks.configure([
    // GOV.UK Frontend templates
    "node_modules/govuk-frontend/dist",
    // ATE Frontend templates
    "node_modules/@active-travel-england/ate-frontend/dist",
]);
```

### Serving the assets

Configure your application to serve the assets. For example, using [Express](https://expressjs.com/):

```javascript
// GOV.UK Frontend assets
app.use("/assets", express.static("node_modules/govuk-frontend/dist/govuk/assets"));
// ATE Frontend assets
app.use("/assets", express.static("node_modules/@active-travel-england/ate-frontend/dist/ate/assets"));
```

Use this path when configuring the component option `assetPath` in your templates. For example:

```nunjucks
{{ ateHeader({
    assetPath: "/assets"
}) }}
```

### Serving the styles

You can either use the prebuilt files or build them yourself if your project uses [Sass](https://sass-lang.com/).

#### Using the prebuilt files

Configure your application to serve the styles. For example, using Express:

```javascript
// GOV.UK Frontend styles with ATE branding
app.use("/styles/govuk-frontend-ate.min.css", express.static("node_modules/@active-travel-england/ate-frontend/dist/ate/govuk-frontend-ate.min.css"));
// GOV.UK One Login service header styles with ATE branding
app.use("/styles/govuk-one-login-service-header-ate.min.css", express.static("node_modules/@active-travel-england/ate-frontend/dist/ate/govuk-one-login-service-header-ate.min.css"));
// ATE Frontend styles
app.use("/styles/ate-frontend.min.css", express.static("node_modules/@active-travel-england/ate-frontend/dist/ate/ate-frontend.min.css"));
```

Add the CSS files to your pages:

```html
<head>
    <!-- GOV.UK Frontend styles with ATE branding -->
    <link rel="stylesheet" href="/styles/govuk-frontend-ate.min.css">
    <!-- GOV.UK One Login service header styles with ATE branding -->
    <link rel="stylesheet" href="/styles/govuk-one-login-service-header-ate.min.css">
    <!-- ATE Frontend styles -->
    <link rel="stylesheet" href="/styles/ate-frontend.min.css">
</head>
```

#### Building them yourself

Alternatively, import the styles to build them yourself:

```scss
// Configure GOV.UK Frontend settings for ATE branding
@use "ate/settings";
$govuk-font-family: settings.$ate-font-family;
$govuk-functional-colours: settings.$ate-functional-colours;

// GOV.UK Frontend styles
@import "govuk";

// GOV.UK One Login service header styles
@import "service-header";

// ATE Frontend styles
@import "ate";
```

Build the CSS using the following [load paths](https://sass-lang.com/documentation/cli/dart-sass/#load-path):

* GOV.UK Frontend: `node_modules/govuk-frontend/dist`
* GOV.UK One Login service header: `node_modules/@govuk-one-login/service-header/dist/styles`
* ATE Frontend: `node_modules/@active-travel-england/ate-frontend/dist`

## Using with the Prototype Kit

This project can also be used as a plugin for the [GOV.UK Prototype Kit](https://prototype-kit.service.gov.uk/).

### Installing

1. [Create a new prototype](https://prototype-kit.service.gov.uk/docs/create-new-prototype)

1. Install ATE Frontend:

   ```bash
   npm install @active-travel-england/ate-frontend
   ```

1. Plugin dependencies are only installed transitively when using the UI.
   [Install the GOV.UK One Login service header](https://github.com/govuk-one-login/service-header/blob/main/docs/prototype-kit-installation.md)
   that is used by ATE Frontend:

   ```bash
   npm install @govuk-one-login/service-header
   ```

1. Configure the [GOV.UK Frontend settings](https://frontend.design-system.service.gov.uk/sass-api-reference/#settings)
   for ATE branding by creating `app/assets/sass/settings.scss`:

   ```scss
   @use "node_modules/@active-travel-england/ate-frontend/dist/ate/settings";
   $govuk-font-family: settings.$ate-font-family;
   $govuk-functional-colours: settings.$ate-functional-colours;
   ```

1. Change the default layout `app/views/layouts/main.html` to use the ATE branding:

   ```diff
   -{% extends "govuk-prototype-kit/layouts/govuk-branded.njk" %}
   +{% extends "ate/layouts/prototype/template.njk" %}
   ```

### Templates

Templates are used to create pages. This plugin provides the following templates:

* Blank ATE page - uses the ATE header and footer
* Blank ATE service page - uses the ATE service header and footer

Learn how to [create pages from templates](https://prototype-kit.service.gov.uk/docs/create-pages-from-templates) in a prototype.

### Layouts

Layouts are used to share a common design across pages. This plugin provides the following layouts:

* `ate/layouts/prototype/template.njk` - uses the ATE header and footer
* `ate/layouts/prototype/service-template.njk` - uses the ATE service header and footer

These layouts support all the [GOV.UK page template](https://design-system.service.gov.uk/styles/page-template/#template-blocks-and-options)
blocks and options, specifically:

| Name                | Type     | Description                                                                                      |
|---------------------|----------|--------------------------------------------------------------------------------------------------|
| `opengraphImageUrl` | Variable | Specify an absolute URL to the ATE Frontend Open Graph image `ate-icons/ate-opengraph-image.png` |
| `themeColor`        | Variable | Defaults to the DfT organisation colour                                                          |

Learn [how to use layouts](https://prototype-kit.service.gov.uk/docs/how-to-use-layouts) in a prototype.

## Building

To build the package:

```bash
npm run build
```

The package files are in the directory `dist`.

## See also

* [Design files](design/README.md)
* [Maintenance](docs/maintenance.md)
* [Releasing](docs/releasing.md)

## Licence

[MIT License](LICENCE)

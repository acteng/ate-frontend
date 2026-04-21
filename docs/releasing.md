# Releasing

To release a new version of this project:

1. Upgrade the package version and create a git tag:

   ```bash
   npm version --tag-version-prefix= -m "Upgrade project version to %s" <version>
   ```

1. Push the commit and tag:

   ```bash
   git push && git push --tags
   ```
   
1. [Create a new GitHub release](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository#creating-a-release):
   * Tag: `<version>`
   * Release title: `<version>`
   * Release notes: Write the release notes for this version
   * Set as a pre-release: Check if not a final release

1. Publishing a new GitHub release triggers the [Release workflow](../.github/workflows/release.yml) that publishes the
   package to npm

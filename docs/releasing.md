# Releasing

To release a new version of this project:

1. Tag the repository for the release:

   ```bash
   git tag <version>
   ```

1. Push the tag:

   ```bash
   git push --tags
   ```
   
1. [Create a new GitHub release](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository#creating-a-release):
   * Tag: `<version>`
   * Release title: `<version>`
   * Release notes: Write the release notes for this version
   * Set as a pre-release: Check if not a final release

1. Publishing a new GitHub release triggers the [Release workflow](../.github/workflows/release.yml) that publishes the
   package to npm

1. Upgrade the package to the next version:

   ```bash
   npm version --no-git-tag-version <next-version>
   ```

1. Stage the changes and commit:

   ```bash
   git commit -m "Upgrade project version to <next-version>"
   ```

1. Push the commit

   ```bash
   git push
   ```

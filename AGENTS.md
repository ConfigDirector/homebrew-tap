# ConfigDirector Homebrew tap

## Instruction scope

Read `../AGENTS.md` if it exists and has not already been loaded. These repository instructions take precedence over parent instructions where they differ.

Also follow the Workflow Rules, Code Design and Writing sections of `../config-director/AGENTS.md`; this repository keeps no copy of them.

`ConfigDirector/homebrew-tap`, used as `brew install ConfigDirector/tap/configdirector`. `Formula/configdirector.rb` installs the CLI's npm tarball, `@configdirector/cli`, with Homebrew's `node`. The product definition is `product-documents/cli-definition.md` in the config-director repository, section 3; the CLI's own repository is `../cli`.

## Releasing

- The CLI's `Release` workflow (`../cli/.github/workflows/release.yml`) updates the formula after every npm publish: it rewrites the `url` and `sha256` lines from the published version and `package.tgz`, commits as `configdirector <version>` and pushes, with the `HOMEBREW_TAP_TOKEN` secret of `ConfigDirector/cli`. The rewrite matches each line by its two-space indent and fails when either line is missing, so the formula keeps exactly one `url` and one `sha256`, at the top level of the class.
- When that step fails, the workflow log names the version, `url` and `sha256` to set; make the same commit by hand.

## Verifying

Run Homebrew in a container, so the formula's `node` dependency never lands in the host's Homebrew:

```bash
docker run --rm -v "$PWD/Formula:/formula:ro" homebrew/brew bash -c '
  brew tap-new --no-git ConfigDirector/tap &&
  cp /formula/configdirector.rb "$(brew --repository ConfigDirector/tap)/Formula/" &&
  brew install ConfigDirector/tap/configdirector &&
  configdirector --version &&
  brew test configdirector &&
  brew audit --strict configdirector'
```

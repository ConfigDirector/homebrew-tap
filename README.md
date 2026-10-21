# ConfigDirector Homebrew tap

Installs `configdirector`, the command line tool for [ConfigDirector](https://www.configdirector.com), the managed configuration and feature flag service:

```bash
brew install ConfigDirector/tap/configdirector
```

The formula installs the CLI's npm package, `@configdirector/cli`, with Homebrew's own Node.js, and is updated with every npm release, so `brew upgrade configdirector` gets the newest one.

The [CLI page of the ConfigDirector docs](https://docs.configdirector.com/integrations/cli) covers signing in, linking a repository to a project and running the CLI in CI. The CLI's source and changelog are in [ConfigDirector/cli](https://github.com/ConfigDirector/cli).

## License

[MIT](LICENSE)

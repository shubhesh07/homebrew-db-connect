# DB Connect — Homebrew Tap

Homebrew tap for [DB Connect](https://github.com/shubhesh07/db-connect) — a free, fast desktop database IDE for **MySQL**, **Amazon Redshift**, and **AWS DynamoDB**.

## Install

```bash
brew install --cask shubhesh07/db-connect/db-connect
```

Or tap first, then install:

```bash
brew tap shubhesh07/db-connect
brew install --cask db-connect
```

Homebrew handles the macOS Gatekeeper unblock automatically — no `xattr` step needed.

## Upgrade

```bash
brew upgrade --cask db-connect
```

## Uninstall

```bash
brew uninstall --cask db-connect
```

To also remove local data (`~/.querypilot`, preferences, caches):

```bash
brew uninstall --cask --zap db-connect
```

## Links

- App repo: https://github.com/shubhesh07/db-connect
- Landing page: https://shubhesh07.github.io/db-connect/
- Release notes: https://github.com/shubhesh07/db-connect/blob/main/CHANGELOG.md

## License

The Cask file in this tap is MIT-licensed. DB Connect itself is free for personal and commercial use; see the main repo for details.
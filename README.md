# homebrew-skuld (Skuld Tap)

This is the public Homebrew tap for the Skuld CLI.

- Install:
  - `brew tap imprisonedmind/skuld`
  - `brew install skuld`
- Upgrade:
  - `brew update && brew upgrade skuld`

Notes
- The formula depends on Homebrew `python` and wraps `python3 -m skuld.cli`.
- The CLI requires a per‑repo mapping before `sync`:
  - In each repo you want to sync: `skuld add`

Maintainers (bump release)
- Tag a new version in the main repo (`imprisonedmind/skuld`):
  - `git tag vX.Y.Z && git push origin vX.Y.Z`
- Compute the tarball SHA256:
  - `curl -L -o skuld-X.Y.Z.tar.gz https://github.com/imprisonedmind/skuld/archive/refs/tags/vX.Y.Z.tar.gz`
  - `shasum -a 256 skuld-X.Y.Z.tar.gz | cut -d' ' -f1`
- Update `Formula/skuld.rb` in this tap with the new `url` and `sha256`, then push.

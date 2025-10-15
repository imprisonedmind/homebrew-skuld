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

Linux install (npm)
- Pre-reqs: Node.js/npm and Python 3 installed on your system.
- Install globally via npm:
  - `npm install -g skuld-cli`
- Run:
  - `skuld --help`
- Notes:
  - The npm package bundles the Python `skuld` module and uses a Node shim to run `python -m skuld.cli`.
  - Ensure `python3` (or `python`) is in PATH; the shim will try `python3` then `python` and sets `PYTHONPATH` automatically.

Maintainers (bump release)
- Tag a new version in the main repo (`imprisonedmind/skuld`):
  - `git tag vX.Y.Z && git push origin vX.Y.Z`
- Compute the tarball SHA256:
  - `curl -L -o skuld-X.Y.Z.tar.gz https://github.com/imprisonedmind/skuld/archive/refs/tags/vX.Y.Z.tar.gz`
  - `shasum -a 256 skuld-X.Y.Z.tar.gz | cut -d' ' -f1`
- Update `Formula/skuld.rb` in this tap with the new `url` and `sha256`, then push.

Linux release (npm)
- Ensure you have publish rights to npm and are logged in (`npm login`) or have `NPM_TOKEN` configured.
- From the monorepo root, use the release script with npm publish enabled:
  - `SKULD_NPM_PUBLISH=1 ./release.sh [patch|minor|major|X.Y.Z]`
- This bumps `skuld-cli/package.json`, tags and pushes the repo, and publishes `skuld-cli` to npm.

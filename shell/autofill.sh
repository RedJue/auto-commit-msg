#!/usr/bin/env bash
# Autofill script.
#
# Produce a commit message from changed files and print to stdout.

# This works similar to a Git hook, but is intended to be used alone or in a Git alias.
#
# See shell/README.md doc.
# See src/git/cli.ts for flags.
set -e

DIFF_FLAGS="--name-status --find-renames --find-copies --no-color --cached"
CHANGES=$(git diff-index $DIFF_FLAGS HEAD)

# TODO: Make this a global bin path.
MESSAGE=$(node out/cli.js "$CHANGES")
echo "$MESSAGE"

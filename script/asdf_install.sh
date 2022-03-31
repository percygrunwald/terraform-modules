#!/usr/bin/env bash

# Run `asdf install` after ensuring that all the required plugins from
# `.tool-versions` are installed. This script is idempotent.

set -e
INSTALLED_PLUGINS=$(asdf plugin-list)

printf "Ensuring required asdf plugins are installed...\n"

while read PLUGIN VERSION; do
  if echo $INSTALLED_PLUGINS | grep -w $PLUGIN > /dev/null; then
    printf "Plugin %s already installed.\n" $PLUGIN
  else
    printf "Installing plugin %s...\n" $PLUGIN
    asdf plugin add $PLUGIN
  fi
done <.tool-versions

printf "Running asdf install...\n"

asdf install

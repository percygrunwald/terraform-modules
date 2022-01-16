#!/bin/bash

set -e
SCRIPT_DIR=$(dirname "$0")

if which asdf > /dev/null; then
  printf "Installing asdf plugins and tools...\n"
  $SCRIPT_DIR/asdf_install.sh
fi

printf "Installing dependencies...\n"
$SCRIPT_DIR/install_deps.sh

printf "Installing pre-commit hook..."
pre-commit install

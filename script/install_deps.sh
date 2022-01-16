#!/bin/bash

# Install all global dependecies required for development, testing and
# pre-commit hooks. This script is idempotent.

set -e

printf "Installing global golang dependencies...\n"
while read DEP; do
  printf 'Installing %s...\n' $DEP
  go install $DEP
done <requirements-golang.txt

printf "Installing global pip dependencies...\n"
pip install -r requirements-python.txt

printf "Installing tflint...\n"
if which tflint > /dev/null; then
  echo "tflint already installed."
else
  curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash
fi

if which asdf > /dev/null; then
  printf "Ensuring asdf shims are up to date...\n"
  asdf reshim golang
  asdf reshim python
fi

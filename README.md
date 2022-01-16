# terraform_modules

![ci](https://github.com/percygrunwald/terraform_modules/actions/workflows/ci.yml/badge.svg)

Terraform modules repo in the style of [*Terraform: Up &amp; Running*](https://learning.oreilly.com/library/view/terraform-up/9781492046899/). Modules from this repo can be referenced by an "infrastructure" repo that deploys live infrastructure, usually with [`terragrunt`](https://terragrunt.gruntwork.io/):

```
terraform {
  source = "${get_env("MODULES_REPO_GIT_URL", "")}//modules/aws/app_instance?ref=v1.2.3"
}
```

## Development setup

The setup scripts are designed for [asdf version manager](http://asdf-vm.com/). If you aren't using `asdf`, you can still use the setup script, but all tools in `.tool-versions` must be installed before running the script.

The setup script is idempotent and ensures all tools, global packages and hooks are installed.

```
# Set up dev environment
script/setup_development.sh
```

## Running the examples and tests

In the spirit of [*Terraform: Up &amp; Running*](https://learning.oreilly.com/library/view/terraform-up/9781492046899/), each module has all of the following:

- A module definition at `modules/PROVIDER/MODULE`
- A runnable example at `examples/PROVIDER/MODULE`
- A test at `test/examples_PROVIDER_MODULE_test.go`

### Setup

The only thing required to run the examples and tests are the necessary environment variables to auth with the providers.

```
# Load AWS creds from ~/.aws/credentials
export AWS_PROFILE=percy_test-github_actions
```

### Run the examples

Change directory to a module example and follow the instructions in the `README.md`:

```
cd examples/aws/app_instance/single_instance
cat README.md
```

### Run the tests

Run all the tests:

```
go test ./test/ -v -timeout 60m
```

Run an individual test:

```
go test ./test/examples_aws_app_instance_test.go -v -timeout 60m
```

## Continuous Integration (CI)

### Testing the CI pipeline locally

You can test the CI pipeline ([Github Actions](https://docs.github.com/en/actions)) locally using [nektos/act](https://github.com/nektos/act). Requires docker.

```
# Install act with go (see docs for other installation options)
go install github.com/nektos/act@latest

# Run the CI pipeline locally
act -s AWS_ACCESS_KEY_ID -s AWS_SECRET_ACCESS_KEY
```

### Clearing the cache

Github Actions is configured to cache certain directories and tools. If you want to clear the cache, simply increment the value in `.github/cache_version`.

# terraform-modules

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

### Run the examples

```
# Change to the example directory
cd examples/aws/app_instance

# Load AWS creds from ~/.aws/credentials
export AWS_PROFILE=percy_test-github_actions

# Initialize terraform
terraform init

# Launch infrastructure
terraform apply

# Destroy infrastructure
terraform destroy
```

Modifying the example vars:

```
terraform apply -var "aws_region=us-west-2"
```

### Run the tests

```
# Load AWS creds from ~/.aws/credentials
export AWS_PROFILE=percy_test-github_actions
```

Run all the tests (`-count 1` is required to prevent caching):

```
go test ./test/ -v -timeout 60m -count 1
```

Run an individual test:

```
go test ./test/ -v -timeout 60m -run TestExamplesAWSAppInstance -count 1
```

## Standard tagging scheme

This repo adopts a standardized and flexible tagging scheme for infrastructure:

- `Org` (`org_name_underscore`, all modules): The name of the organization/company
- `Team` (`team_name_underscore`, all modules): The name of the team/project within the org
- `Environment` (`env`, all modules): The name of the service/application environment (e.g. `dev`, `prod`, etc.)
- `Service` (`service_name_underscore`, most modules): The name of the service/application within the env

The implicit logical hierarch is that:

- A team/project exists within an org/company
- An environment exists within a team/project
- A service/application exists within an environment

Org > Team > Env > Service
## Continuous Integration (CI)

### Testing the CI pipeline locally

You can test the CI pipeline ([Github Actions](https://docs.github.com/en/actions)) locally using [nektos/act](https://github.com/nektos/act). Requires docker.

The `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY` and `GITHUB_TOKEN` secrets must be passed or set in the current env. If any of these are not set, `act` will prompt you to enter them. `GITHUB_TOKEN` is required for some actions and can be a [personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) with empty permissions.

`--reuse` reuses the containers for each workflow job, keeping all installed tools/dependencies. This is recommended for frequent runs since `act` [cannot make use of actions caching](https://github.com/nektos/act/issues/285#issuecomment-987550101), which means all tools/dependencies must be downloaded each time. If you ever want to start again from scratch (empty container), just run without `--reuse`.

```
# Install act with go (see docs for other installation options)
go install github.com/nektos/act@latest

# Export required env vars
export AWS_ACCESS_KEY_ID=...github_actions user for test account...
export AWS_SECRET_ACCESS_KEY=...github_actions user for test account...
export GITHUB_TOKEN=...nektos/act personal access token...

# Run the CI pipeline locally
act -s AWS_ACCESS_KEY_ID -s AWS_SECRET_ACCESS_KEY -s GITHUB_TOKEN --reuse
```

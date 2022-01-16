# terraform_modules
Terraform modules repo in the style of "Terraform: Up &amp; Running"

## Development setup

The setup scripts are designed for [asdf version manager](http://asdf-vm.com/). If you aren't using `asdf`, you can still use the setup script, but all tools in `.tool-versions` must be installed before running the script.

The setup script ensures all tools, global packages and hooks are installed and is idempotent.

```
# Set up dev environment
script/setup_development.sh
```

## Running the examples and tests

In the spirit of *Terraform: Up & Running*, each module has all of the following:

- A module definition at `modules/PROVIDER/MODULE`
- A runnable example at `examples/PROVIDER/MODULE`
- A test at `test/examples_PROVIDER_MODULE_test.go`

### Setup

The only thing required to run the examples and tests are the necessary environment variables to auth with the providers.

```
# Load AWS creds from ~/.aws/credentials
export AWS_PROFILE=percy_test-gitlab_actions
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
go test ./test/examples_aws_ha_web_app_test.go -v -timeout 60m
```

## Testing the CI pipeline locally

You can test the CI pipeline (Github Actions) locally using [`act`](https://github.com/nektos/act). Requires docker.

```
# Install act with go (see docs for other installation options)
go install github.com/nektos/act@latest

# Run the CI pipeline locally
act
```

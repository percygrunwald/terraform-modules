# terraform_modules
Terraform modules repo in the style of "Terraform: Up &amp; Running"

## Development setup

These instructions assume that you are using [asdf version manager](http://asdf-vm.com/), which I highly recommend. If not, you will need the languages listed in `.tool-versions` installed.

```
# Install asdf plugins and ensure correct versions of all languages are installed
asdf plugin add golang
asdf plugin add terraform
asdf plugin add python
asdf install

# Install golint
go get -u golang.org/x/lint/golint
asdf reshim golang

# Install tflint
curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash
asdf reshim python

# Install pre-commit and its hooks into git
pip install pre-commit
pre-commit install
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

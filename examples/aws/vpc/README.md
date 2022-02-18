# aws/vpc example

Launches multiple instances using the `aws/vpc` module.

## Quick start

Deploy the example:

```
cd examples/aws/vpc
export AWS_PROFILE=...
terraform init
terraform apply
```

Clean up:

```
terraform destroy
```

## Running in a different region

When running `apply`, simply pass the `aws_region` variable:

```
terraform apply -var "aws_region=us-west-2"
```

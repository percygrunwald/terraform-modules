# aws/app_instance multi instance example

Launches multiple instances using the `aws/app_instance` module.

## Quick start

Deploy the example:

```
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

<!-- BEGIN_TF_DOCS -->
{{ .Content }}
<!-- END_TF_DOCS -->

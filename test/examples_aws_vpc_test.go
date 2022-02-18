package test

import (
	"errors"
	"fmt"
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/retry"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestExamplesAWSVPC(t *testing.T) {

	t.Parallel()

	opts := &terraform.Options{
		TerraformDir: "../examples/aws/vpc",

		Vars: map[string]interface{}{
			"aws_region":           "sa-east-1",
			"env":                  "test",
			"team_name_underscore": fmt.Sprintf("percygrunwald_%s", random.UniqueId()),
		},
	}

	// Use retries to delete the VPC due to bug:
	// https://github.com/terraform-aws-modules/terraform-aws-vpc/issues/373
	defer retry.DoWithRetry(t, "Destroying VPC with retries...", 3, 3*time.Second, func() (string, error) {
		_, err := terraform.DestroyE(t, opts)

		if err != nil {
			return "", errors.New("Error destroying VPC")
		}

		return "", nil
	})

	terraform.InitAndApply(t, opts)

	outputPublicSubnetIDsList := terraform.OutputList(t, opts, "public_subnet_ids")
	outputPublicSubnetIDsCount := len(outputPublicSubnetIDsList)
	expectedPublicSubnetIDsCount := 2

	assert.Equal(t, expectedPublicSubnetIDsCount, outputPublicSubnetIDsCount)
}

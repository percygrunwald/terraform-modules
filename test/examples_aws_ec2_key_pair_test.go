package test

import (
	"fmt"
	"testing"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestExamplesAWSEC2KeyPair(t *testing.T) {

	t.Parallel()

	user := fmt.Sprintf("test_%s", random.UniqueId())
	opts := &terraform.Options{
		TerraformDir: "../examples/aws/ec2_key_pair",

		Vars: map[string]interface{}{
			"user": user,
		},
	}

	defer terraform.Destroy(t, opts)

	terraform.InitAndApply(t, opts)
}

package test

import (
	"fmt"
	"testing"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestExamplesAWSEC2KeyPair(t *testing.T) {

	t.Parallel()

	keyName := fmt.Sprintf("test_%s", random.UniqueId())
	opts := &terraform.Options{
		TerraformDir: "../examples/aws/ec2_key_pair",

		Vars: map[string]interface{}{
			"key_name": keyName,
		},
	}

	defer terraform.Destroy(t, opts)

	terraform.InitAndApply(t, opts)

	outputKeyName := terraform.OutputRequired(t, opts, "key_name")

	assert.Equal(t, outputKeyName, keyName)
}

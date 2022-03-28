package test

import (
	"fmt"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestExamplesAWSAppInstance(t *testing.T) {

	t.Parallel()

	uniqueID := strings.ToLower(random.UniqueId())
	instances := map[string]string{
		fmt.Sprintf("%s_test_201", uniqueID): "t3.micro",
		fmt.Sprintf("%s_test_202", uniqueID): "t3.micro",
		fmt.Sprintf("%s_test_203", uniqueID): "t3.micro",
	}

	opts := &terraform.Options{
		TerraformDir: "../examples/aws/app_instance",

		Vars: map[string]interface{}{
			"instances": instances,
		},
	}

	defer terraform.Destroy(t, opts)

	terraform.InitAndApply(t, opts)

	outputInstancesMap := terraform.OutputMap(t, opts, "instances")
	outputInstancesCount := len(outputInstancesMap)
	expectedInstancesCount := 3

	assert.Equal(t, expectedInstancesCount, outputInstancesCount)
}

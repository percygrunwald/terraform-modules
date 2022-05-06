package test

import (
	"fmt"
	"testing"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestExamplesAWSEKSCluster(t *testing.T) {

	t.Parallel()

	opts := &terraform.Options{
		TerraformDir: "../examples/aws/eks_cluster",

		Vars: map[string]interface{}{
			"cluster_name": fmt.Sprintf("example_%s", random.UniqueId()),
		},
	}

	// Only test the init since this module takes so long to run
	terraform.Init(t, opts)
}

package terraform

import  (
	"testing"
	"github.com/stretchr/testify/assert"
        "github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTask1Plan(t *testing.T) {
terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../task1",
	})
 terraform.InitAndPlan(t, terraformOptions)
}


func TestTagsValidation(t *testing.T) {
terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
                TerraformDir: "../task1",
        })
//Clean up after Tests
 defer terraform.Destroy(t, terraformOptions)
 terraform.InitAndApply(t, terraformOptions)
 tags := terraform.OutputMap(t, terraformOptions,"tags")
 assert.Contains(t, tags, "Name: Flugel")
 assert.Contains(t, tags, "Owner: InfraTeam")
}

package terraform

import  (
	"testing"
	"github.com/stretchr/testify/assert"
        "github.com/gruntwork-io/terratest/modules/terraform"
)

func TestInitAndPlan(t *testing.T) {
terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../test1",
	})
 terraform.InitAndPlan(t, terraformOptions)
 tags := terraform.OutputMap(t, terraformOptions,"tags")
 assert.Contains(t, tags, "Name: Flugel")
}

//func ValidateTag(t *testing.T) {
//terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
//                TerraformDir: "../test1",
//        })
// terraform.InitAndPlan(t, terraformOptions)
// tags := terraform.OutputMap(t, terraformOptions,"tags")
// assert.Contains(t, tags, "Name: ugel")

//}

package terraform
import  (
	"testing"
        "github.com/gruntwork-io/terratest/modules/terraform"
	"fmt"
	"time"
	 http_helper "github.com/gruntwork-io/terratest/modules/http-helper"

)

func TestTask2Plan(t *testing.T) {
terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../task2",
	})
 terraform.InitAndPlan(t, terraformOptions)
}



func TestTask2ApplicationReachability(t *testing.T) {
terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
                TerraformDir: "../task2",
        })

 defer terraform.Destroy(t, terraformOptions)
 terraform.InitAndApply(t, terraformOptions)

 publicdns := terraform.Output(t, terraformOptions,"dns_name")
 url := fmt.Sprintf("https://%s", publicdns)
 http_helper.HttpGetWithRetry(t, url, nil, 200, "Website is avilable", 30, 5*time.Second)
}

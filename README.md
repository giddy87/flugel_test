# FLUGEL evaluation

Infrastructure as Code Task:

 - Write Terraform code to create an S3 bucket and an EC2 instance with both tagged with Name=Flugel, Owner=InfraTeam.
 - Write IaC tests using Terratest, to create the test automation for the Terraform code, and validating that both resources are tagged properly.

# task 1

This involves provisioning an EC2 instance and s3 bucket with tags **Name=Flugel, Owner=InfraTeam**.
The terraform scripts are [here](https://github.com/giddy87/flugel_test/tree/test1/task1)

The aws provider is used and hence AWS credentials must be set as variables in addition to other variables required for the build.

| Variables | DEFAULT |
|--|--|
| AWS_SECRET_ACCESS_KEY |  ''|
|  AWS_SECRET_ACCESS_KEY| '' |
|AWS_DEFAULT_REGION|us-east-2|
|  ami| ami-09862fadec6997084 |
|--|--|
|  |  |
 |  |
**Building Infrastructure:**
For this relatively lean build, the resources been provisioned are single EC2 instance, Single S3 bucket, and an ssh key.


**Testing Infrastructure** 
**Locally**:
To Validate Infrastructure using Terratest:

    cd test\
    go test -v
**[Using Github actions](https://github.com/giddy87/flugel_test/actions)**:
The pipeline yaml file is accessible [here](https://github.com/giddy87/flugel_test/blob/test1/.github/workflows/pipeline.yml).
Before building, AWS Credential keys must be setup as secrets (Repo > Settings > Secrets). 
```

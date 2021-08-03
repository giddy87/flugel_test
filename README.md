# FLUGEL evaluation

Infrastructure as Code Task:

 - Write Terraform code to create an S3 bucket and an EC2 instance with both tagged with Name=Flugel, Owner=InfraTeam.
 - Write IaC tests using Terratest, to create the test automation for the Terraform code, and validating that both resources are tagged properly.
 - A cluster of 2 EC2 instances behind an ALB running Nginx, serving a static file. This static file must be generated at boot, using a Python script. Put the AWS instance tags in the file.
 -   The cluster must be deployed in a new VPC. This VPC must have only one public subnet, Not using default VPC.
-   Update the tests to validate the infrastructure. The test must check that files are reachable in the ALB.

# task 1

Provisioning an EC2 instance and s3 bucket with tags **Name=Flugel, Owner=InfraTeam**.
The terraform scripts are [here](https://github.com/giddy87/flugel_test/tree/test1/task1)

The aws provider is used and hence AWS credentials must be set as variables in addition to other variables required for the build.

| Variables | DEFAULT |
|--|--|
| AWS_SECRET_ACCESS_KEY |  ''|
|  AWS_SECRET_ACCESS_KEY| '' |
|AWS_DEFAULT_REGION|us-east-2|
|  ami| ami-09862fadec6997084 |
**Building Infrastructure:**
For this relatively lean build, the resources been provisioned are single EC2 instance, Single S3 bucket, and an ssh key.

# task 2
Provisioning an EC2 instance and s3 bucket with tags **Name=Flugel, Owner=InfraTeam**.
Provisioning a cluster of 2 EC2 instances behind an ALB running Nginx, serving a static file generated using a Python script. and the underlying infrastructure - Networks, igw, security groups, 
The terraform scripts are [here](https://github.com/giddy87/flugel_test/tree/test1/task1)
| Variables | DEFAULT |
|--|--|
| AWS_SECRET_ACCESS_KEY |  ''|
|  AWS_SECRET_ACCESS_KEY| '' |
|AWS_DEFAULT_REGION|us-east-2|
|  ami| ami-09862fadec6997084 |
| az_a | us-east-2a |
|az_b|us-east-2b|
|instance_type  |t2.micro  |
|instance_count  |2  |



**Testing Infrastructure (Terratest)**
The tests are written in the test\ directory .
The entire tests consists of 4 functions
[TestTask1Plan](https://github.com/giddy87/flugel_test/blob/main/test/task1_test.go) : This test initializes terraform and plans the Infrastructure for task 1, while failing if error.
[TestTagsValidation](https://github.com/giddy87/flugel_test/blob/main/test/task1_test.go): This test applies(deploys) the Iac scripts, checks that the provisioned resources have tags that match the conditions and then deletes all resources after test completion.
[TestTask2Plan:](https://github.com/giddy87/flugel_test/blob/main/test/task2_test.go)  This test initializes terraform and plans the Infrastructure for task 2, while failing if error.
[TestTask2ApplicationReachability](https://github.com/giddy87/flugel_test/blob/main/test/task2_test.go): This test deploys the ALB and two instance cluster, underlying resources such as Vpc, Subnet (Public and Private), ALB target group, IGW, NAT, Routes, Security Groups etc.
This then checks the if the Static Website is Available from the dns name generated upon deployment.
Finally this tasks deletes all provisioned resources upon test completion. 


**Locally**:
To Validate the entire Infrastructure, using Terratest:

    cd test\
    go test -v
**[Using Github actions](https://github.com/giddy87/flugel_test/actions)**:
The pipeline yaml file is accessible [here](https://github.com/giddy87/flugel_test/blob/main/.github/workflows/pipeline.yml)
Before building, AWS Credential keys must be setup as secrets (Repo > Settings > Secrets). 
```


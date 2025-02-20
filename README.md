Jay's proj repo for DevOps Training : Docker, Kubernetes, Terraform, Azure DevOps (by R.Karanam)

repo: azure-devops-k8s-terraform-pipeline
- modified pipeline
- created self-hosted agent (FirstAgent) in agent pool (TestAgent) to run pipeline locally; successfully ran test pipeline
- created starter pipeline: 01-1st-azure-pipeline.yml
- added project; modified readme
- created gh repo for azure pipeline, cloned, used currencyexchangeservice microservice to test; 

proj: terraform-test
- created folder 08-modules; created terraform modules for users; referenced module using module "user_module" for dev and qa; used locals
- created workspaces (prod); factored in workspace when creating resources: aws_iam_user; terraform workspace commands: new, list, select, delete
- modified user/main.tf to use backend s3: added backend "s3" block; added bucket, key, region, dynamodb_table, encrypt
- created folder 07-s3-backend-state; created resource aws-s3-bucket for backend state w/ lifecycle settings; created resource aws_s3_bucket_versioning for versioning; created resource aws_s3_bucket_server_side_encryption_configuration for encryption; created resource aws_dynamodb_table for lock table
- created custom security group for ELB; created Elastic Load Balancer: aws_elb resource
- created folder 06-ec2-elb from previous 05-ec2-instances; modified aws_instance to create ec2 instances in multiple subnets: for_each/toset on aws_subnets
- created data-providers.tf
- used data provider to get default ami - data "aws_ami"
- used data provider to get default subnets - data "aws_subnets"
- extracted VPC from AWS resource, aws_default_vpc instead of hardcoding vpc_id
- Installed HttpServer on ec2: created connection and provisioner blocks, used keypair to connect to ec2 instance; tested running successfully!
- created EC2 Key Pair; created aws_instance (ec2 instance)
- created folder 05-ec2-instances; created ec2 instance; created security group: ingress, egress; 
- created folder 04-maps; created map; map functions: tomap, keys, values, lookup; tags; map of maps
- used set (toset) to use name as key instead of index
- created users from list; explored list functions
- used variables in tf files; terraform.tfvars
- initialized new terraform project; created 2 IAM users
- separated tf files; terraform destroy to cleanup
- created new AWS user via terraform, updated name
- created s3 bucket via terraform, edited versioning
- created new AWS user, access keys
- initialize AWS provider; setup new AWS user, access keys
- main.tf
- env setup

repo: DEVOPS-MASTER-CLASS
- cleaned up and optimized deployment.yaml
- generated, modified K8s deployment/service.yaml via kubectl ">" and "-o yaml" options; kubectl apply -f

proj: hworld-java (dep: spring boot, jdk 21)
- created java project: controller, etc; created Dockerfile; created docker image and ran container

proj: hworld-nodejs (dep: express)
- added ENTRYPOINT alternative to CMD in Dockerfile
- created js file - output on port 5000; created Dockerfile; created docker image and ran container

proj: hworld-python (dep: flask)
- added ENTRYPOINT alternative to CMD in Dockerfile
- created py file - output on port 5000; defined requirements.txt; created Dockerfile; created docker image and ran container

Jay's proj repo for DevOps Training : Docker, Kubernetes, Terraform, Azure DevOps (by R.Karanam)

proj: terraform-test
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

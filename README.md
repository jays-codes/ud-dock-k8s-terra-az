Jay's proj repo for DevOps Training : Docker, Kubernetes, Terraform, Azure DevOps (by R.Karanam)

repo: DEVOPS-MASTER-CLASS
- generated, modified K8s deployment/service.yaml via kubectl ">" and "-o yaml" options; kubectl apply -f

proj: hworld-java (dep: spring boot, jdk 21)
- created java project: controller, etc; created Dockerfile; created docker image and ran container

proj: hworld-nodejs (dep: express)
- added ENTRYPOINT alternative to CMD in Dockerfile
- created js file - output on port 5000; created Dockerfile; created docker image and ran container

proj: hworld-python (dep: flask)
- added ENTRYPOINT alternative to CMD in Dockerfile
- created py file - output on port 5000; defined requirements.txt; created Dockerfile; created docker image and ran container

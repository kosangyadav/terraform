; After terraform installation, and writing HCL code in main.tf file...

; Commands to execute main.tf file...

; initialize the terraform in current directory 
terraform init

; validate your code for syntax and errors
terraform validate

; see the plan, what will happen after execution
terraform plan

; execute the plan as well as refresh
terraform apply
terraform apply --auto-approve    ; to execute without confirmation

; just to refresh the terraform states and others, without execution
terraform refresh

; after execution, to undo the execution or destroy all the resources created by terraform
terraform destroy
terraform destroy  --auto-approve ; to execute without confirmation

; after execution, to destroy specific resources using -target
terraform destroy -target aws_security_group.aws_sg



; other state's related commands...

; after execution, to see the list of the resources from state list
terraform state list

; see the details of a particular resource with the name from list
terraform state show <resource-name>


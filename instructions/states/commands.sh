# command to check the current state of terraform resources is:
terraform state list

# command to import existing resources into terraform state is:
terraform import <resource_type.resource_name> <resource_id>

# command to display the detailed state of a specific resource is:
terraform state show <resource_type.resource_name>
terraform state show 'aws_instance.tf-instance["small instance"]'   #  to show details of a specific instance(speacially)

# command to remove a resource from the state file without destroying it is:
terraform state rm <resource_type.resource_name>

# command to move a resource in the state file is:
terraform state mv <source> <destination>



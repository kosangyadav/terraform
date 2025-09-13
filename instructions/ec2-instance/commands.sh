# commands to spin up the ec2 instance with the current conifgurations.
#
# zeroth : you must have terrafrom and aws-cli, installed and configured before this.
#
# first : go inside the folder of name ec2-good, if you are on root.
cd ec2-good
#
# second : create a rsa type key for instance as key-value pair with name test-rsa, execute it once only.
ssh-keygen -t rsa -b 4096 -f test-rsa
 
# third : initialise the terrafrom backend.
terraform init
#
# forth : validate the script.
terrafrom validate
#
# fifth : see the plan, what's going to happen after execution.
terrafrom plan
#
# sixth : execute the plan and pray everything will go right.
terrafrom apply
# or
terrafrom apply --auto-approve
#
# if everything gone right, you can see a ec2 instance in console has been spun up with name terraform-server.
# if you want to connect to the instance without going to console, from just screen of your terminal.
# after terrafrom apply you can see instance's details like ip and dns and more, you can using them.
#
# ssh -i test-rsa ec2-user@<public-dns>
#
# like this one.
# ssh -i test-rsa ec2-user@ec2-43-207-106-220.ap-northeast-1.compute.amazonaws.com
# ssh -i <private-key> <username>@<public-dns>
#
# after all this, and completion of the work with instance, you may also delete from just here...
# terrafrom destroy
#

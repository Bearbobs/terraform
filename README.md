# Terraform 101

useful configs and starter workflows for terraform

### -> Avoid variables.tf to upload your credentials to git:

  `git update-index --assume-unchanged variables.tf`

  To undo and start tracking again :

  `git update-index --no-assume-unchanged variables.tf`

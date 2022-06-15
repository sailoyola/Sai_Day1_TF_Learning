
#
# DO NOT DELETE THESE LINES UNTIL INSTRUCTED TO!
#
# Your AMI ID is:
#
#     "ami-00482f016b2410dc8"
#
# Your subnet ID is:
#   

# "subnet-00af79b22f4998cc1"

#
# Your VPC security group ID is:
#  

# "sg-040da1415abc00d40"

#
# Your Identity is:
#
#     "awsaccount"
#




provider "aws" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

/*resource "aws_instance" "web" {
  # ...
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  tags = {
    "Identify" = var.identity
    "Name"     = var.name
    "Env"      = var.env
  }
}*/

//Add the following block:

module "server" {
  source = "./server"

  ami                    = var.ami
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  identity               = var.identity
  key_name               = module.keypair.key_name
  private_key            = module.keypair.private_key_pem
}

module "keypair" {
  source  = "mitchellh/dynamic-keys/aws"
  version = "2.0.0"
  path    = "${path.root}/keys"
  name    = "${var.identity}-key"
}
/* variable "access_key" {}
variable "secret_key" {}
variable "region" {
  default = "us-east-1"
}
variable "ami" {}
variable "subnet_id" {}
variable "identity" {}
variable "vpc_security_group_ids" {
  type = list(string)
}
variable "instance_type" {}
variable "name" {}
variable "env" {} */

variable "ami" {}
variable "subnet_id" {}
variable "vpc_security_group_ids" {
  type = list(string)
}
variable "identity" {}
variable "key_name" {}
variable "private_key" {}

 variable num_webs {
  default = "2"
}
variable "resource_group_name" {}
variable "location" {}
variable "vnet_name" {}
variable "vnet_cidr" {}
variable "jenkins_subnet_name" {}
variable "jenkins_subnet_cidr" {}
variable "jenkins_vm_size" {}
variable "jenkins_hostname" {}
variable "admin_username" {}
variable "ssh_public_key" {}
variable "storage_account_name" {}

locals {
  myip = "${chomp(data.http.icanhazip.body)}"
}

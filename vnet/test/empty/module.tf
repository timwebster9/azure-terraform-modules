module "default" {
    source                 = "../../modules/empty"
    resource_group_name    = "${var.resource_group_name}"
    location               = "${var.location}"
    vnet_name              = "${var.vnet_name}"
    vnet_cidr              = "${var.vnet_cidr}"
    bastion_subnet_name    = "${var.bastion_subnet_name}"
    bastion_subnet_cidr    = "${var.bastion_subnet_cidr}"
    jenkins_subnet_name    = "${var.jenkins_subnet_name}"
    jenkins_subnet_cidr    = "${var.jenkins_subnet_cidr}"
    aks_subnet_name        = "${var.aks_subnet_name}"
    aks_subnet_cidr        = "${var.aks_subnet_cidr}"
}
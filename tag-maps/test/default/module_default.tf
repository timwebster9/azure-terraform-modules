module "default" {
    source           = "../../modules/default"
    resource_group   = "${var.resource_group}"
    location         = "${var.location}"
    common_tags      = "${var.common_tags}"
}
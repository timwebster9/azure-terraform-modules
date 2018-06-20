module "default" {
    source           = "../../modules/default"
    client_id        = "${var.client_id}"
    client_secret    = "${var.client_secret}"
    resource_group   = "${var.resource_group}"
    location         = "${var.location}"
    cluster_name     = "${var.cluster_name}"
    dns_prefix       = "${var.dns_prefix}"
    ssh_public_key   = "${var.ssh_public_key}"
    agent_count      = "${var.agent_count}"
    vm_size          = "${var.vm_size}"
}
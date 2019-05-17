module "nsg" {
  source              = "../../"
  resource_group_name = "${var.resource_group_name}"
  location            = "${var.location}"
  security_group_name = "${var.security_group_name}"

  predefined_rules = [
    {
      name = "SSH"
    },
  ]

  custom_rules               = "${var.custom_rules}"
  source_address_prefix      = "${var.source_address_prefix}"
  destination_address_prefix = "${var.destination_address_prefix}"
  destination_application_security_group_ids = "${module.asg_bation.asg_id}"
  tags                       = "${var.tags}"
}

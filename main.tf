############################################################################
## MODULE LOCALS
############################################################################
locals {
  resource_prefix = "${lower(substr(trimspace(var.project_short_name), 0 , 8))}-${var.environment}"

  vpc_tags = "${
        merge(
            map("Name", "${local.resource_prefix}"),
            map("Project Name", "${var.project_name}"),
            map("Project Code", "${var.project_code}"),
            map("Business Unit", "${var.business_unit}"),
            map("Environment", "${var.environment}"),
            map("Service Owner Support", "${var.service_owner_support}"),
            map("Environment", "${var.requestor}"),
        )
    }"
}

############################################################################
## MODULE PROVIDERS
############################################################################
provider "aws" {
  alias   = "module"
  version = "~> 1.0"
  region  = "${var.provider_region}"

  assume_role {
    role_arn     = "arn:aws:iam::${var.provider_account_id}:role/${var.provider_role_name}"
    session_name = "SESSION_NAME"
    external_id  = "EXTERNAL_ID"
  }

  # Restrict provider access
  allowed_account_ids = ["${var.provider_account_id}"]

  # Performance and error handling tweaks
  max_retries = "${var.provider_max_retries}"
}

############################################################################
## MODULE RESOURCES
############################################################################
resource "aws_vpc" "main" {
  provider                         = "aws.module"
  cidr_block                       = "${var.cidr_block}"
  instance_tenancy                 = "${var.instance_tenancy}"
  enable_dns_support               = "${var.instance_tenancy}"
  enable_dns_hostnames             = "${var.enable_dns_hostnames}"
  assign_generated_ipv6_cidr_block = "${var.assign_generated_ipv6_cidr_block}"
  tags                             = "${local.vpc_tags}"
}
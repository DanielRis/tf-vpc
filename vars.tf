############################################################################
## MODULE INPUTS AND DEFAULTS
############################################################################

############################################################################
## NASDAQ META DATA
############################################################################
variable "project_name" {
  description = "Billing Project Name (e.g. NDW2)"
  type        = "string"
}

variable "project_short_name" {
  description = "Project Short Name used as prefix for most resources (e.g. myproject)"
  type        = "string"
}

variable "project_code" {
  description = "Billing Project Code (e.g. 123456)"
  type        = "string"
}

variable "business_unit" {
  description = "Business Unit acronym (e.g. GCS, GTMS, NPM, etc.)"
  type        = "string"
}

variable "environment" {
  description = "Environment acronym [OPS|POC|DEV|QC|UAT|PRO|DR]"
  type        = "string"
}

variable "service_owner_support" {
  description = "Email Distribution List for the OPS/APP support team (e.g. DL-VerySpecialOpsTeam@nasdaq.com)"
  type        = "string"
}

variable "requestor" {
  description = "Email address of the resource requestor (e.g. First.Last@nasdaq.com)"
  type        = "string"
}

############################################################################

############################################################################
## CLOUD PROVIDER
############################################################################
variable "provider_account_id" {
  description = "Target AWS Account ID"
  type        = "string"
}

variable "provider_role_name" {
  description = "AWS IAM Role used for resource management"
  type        = "string"
}

variable "provider_region" {
  description = "Target AWS region used for resource deployment"
  type        = "string"
}

variable "provider_max_retries" {
  description = "Maxium retries on API communication errors or throtteling events"
  type        = "string"
  default     = "5"
}

############################################################################

############################################################################
## MODULE SPECIFIC
############################################################################
variable "cidr_block" {
  description = "The IPv4 network range for the VPC, in CIDR notation (e.g. 10.0.0.0/16)"
  type        = "string"
}

variable "instance_tenancy" {
  description = "The tenancy options for instances launched into the VPC. [default*|dedicated]"
  type        = "string"
  default     = "default"
}

variable "enable_dns_hostnames" {
  description = "Indicates whether the instances launched in the VPC get DNS hostnames. [true|false*]"
  type        = "string"
  default     = "false"
}

variable "enable_dns_support" {
  description = "Indicates whether the DNS resolution is supported for the VPC. If enabled, queries to the Amazon provided DNS server at the 169.254.169.253 IP address, or the reserved IP address at the base of the VPC network range \"plus two\" will succeed. If disabled, the Amazon provided DNS service in the VPC that resolves public DNS hostnames to IP addresses is not enabled. [true*, false]"
  type        = "string"
  default     = "true"
}

variable "assign_generated_ipv6_cidr_block" {
  description = "Request an Amazon provided IPv6 CIDR block with a /56 prefix length for the VPC [true, false*]"
  type        = "string"
  default     = "true"
}

############################################################################

variable "bucket_name" {
  description = "The name of the account"
}

variable "bucket_prefix" {
  description = "Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket"
  default     = null
}

variable "acl" {
  default = null
}

variable "versioning" {
  default = false
}

variable "block_public_access" {
  default = true
}

variable "lifecycle_rule_enabled" {
  default     = false
  description = "Enable lifecycle_rule"
}

variable "prefix" {
  default     = null
  description = "lifecycle prefix"
}

variable "lifecycle_tags" {
  default = null
}

variable "glacier_transition_days" {
  default = 90
}

variable "enable_glacier_transition" {
  default = false
}

variable "standard_transition_days" {
  default = 90
}

variable "allowed_headers" {
  type    = list(string)
  default = ["*"]
}

variable "allowed_methods" {
  type    = list(string)
  default = ["GET"]
}

variable "allowed_origins" {
  type    = list(string)
  default = ["*"]
}

variable "enable_standard_ia_transition" {
  default = false
}

variable "expiration_days" {
  default = 90
}

variable "enable_current_object_expiration" {
  default = false
}

variable "logging" {
  type = object({
    bucket_name = string
    prefix      = string
  })
  default     = null
  description = "Bucket access logging configuration."
}

variable "s3_kms_arn" {
  description = "The optional kms for encryption . Defaults to s3 arn"
  default     = ""
}

variable "server_side_encryption_configuration" {
  description = "Map containing server-side encryption configuration."
  type        = any
  default     = {}
}

variable "override_json" {
  default     = ""
  description = "When using override_json, the current policy document is overridden by the imported policy.Note that statement IDs (sid) have to match in order to actually override any statements. Otherwise they will be merged."
}

locals {
  override_json = var.override_json == "" ? null : var.override_json
}

variable "set_bucket_suffix" {
  default = false
}

variable "lifecycle_rule" {
  description = "List of maps containing configuration of object lifecycle management."
  type        = any
  default     = []
}

variable "cors_rule" {
  description = "List of maps containing rules for Cross-Origin Resource Sharing."
  type        = any
  default     = []
}

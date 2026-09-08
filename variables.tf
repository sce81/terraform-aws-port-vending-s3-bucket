variable "bucket_name" {
  description = "Name of the S3 bucket."
  type        = string
  default     = "port-account-vending-example"

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9.-]{1,61}[a-z0-9]$", var.bucket_name)) && !can(regex("\\.\\.", var.bucket_name)) && !can(regex("^[0-9]+\\.[0-9]+\\.[0-9]+\\.[0-9]+$", var.bucket_name)) && !startswith(var.bucket_name, "xn--") && !startswith(var.bucket_name, "sthree-") && !startswith(var.bucket_name, "amzn-s3-demo-") && !endswith(var.bucket_name, "-s3alias") && !endswith(var.bucket_name, "--ol-s3") && !endswith(var.bucket_name, ".mrap") && !endswith(var.bucket_name, "--x-s3") && !endswith(var.bucket_name, "--table-s3")
    error_message = "bucket_name must be a 3-63 character lowercase DNS-compatible S3 bucket name, cannot contain consecutive periods, cannot be an IPv4 address, and cannot use an AWS-reserved prefix or suffix."
  }
}

variable "env" {
  description = "Deployment environment used in the module's common tags."
  type        = string

  validation {
    condition     = length(trimspace(var.env)) > 0
    error_message = "env must not be empty."
  }
}

variable "project" {
  description = "Project identifier used in the module's common tags."
  type        = string

  validation {
    condition     = length(trimspace(var.project)) > 0
    error_message = "project must not be empty."
  }
}

variable "name" {
  description = "Logical module name used in the module's common tags."
  type        = string

  validation {
    condition     = length(trimspace(var.name)) > 0
    error_message = "name must not be empty."
  }
}

variable "extra_tags" {
  description = "Additional tags to apply to the bucket."
  type        = map(any)
  default     = {}
}

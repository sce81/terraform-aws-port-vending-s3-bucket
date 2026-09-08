locals {
  common_tags = {
    Name        = "${var.env}-${var.project}-${var.name}"
    Environment = var.env
    Project     = var.project
    Terraform   = "true"
  }

  tags = merge(
    local.common_tags,
    var.extra_tags,
  )
}

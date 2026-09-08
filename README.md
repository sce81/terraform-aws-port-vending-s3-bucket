# AWS Port Vending S3 Bucket

Creates a private, versioned S3 bucket for Port account vending. The AWS provider and its region are configured by the calling root module; the expected region is `eu-west-1`.

## Usage

```hcl
module "port_vending_s3_bucket" {
  source = "git::https://github.com/sce81/terraform-aws-port-vending-s3-bucket.git?ref=v1.0.0"

  env     = "production"
  project = "port"
  name    = "account-vending"
}
```

By default, the bucket is named `port-account-vending-example`.

## Features

- Blocks all public access.
- Enforces `BucketOwnerEnforced` object ownership.
- Enables AES-256 server-side encryption by default.
- Enables versioning.
- Applies standard `Environment`, `Project`, `Name`, and `Terraform` tags, plus `extra_tags`.

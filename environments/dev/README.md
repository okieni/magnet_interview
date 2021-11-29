<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.56.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.my_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_policy.my_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.my_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_iam_policy_document.my_s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acl"></a> [acl](#input\_acl) | n/a | `any` | `null` | no |
| <a name="input_allowed_headers"></a> [allowed\_headers](#input\_allowed\_headers) | n/a | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| <a name="input_allowed_methods"></a> [allowed\_methods](#input\_allowed\_methods) | n/a | `list(string)` | <pre>[<br>  "GET"<br>]</pre> | no |
| <a name="input_allowed_origins"></a> [allowed\_origins](#input\_allowed\_origins) | n/a | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| <a name="input_block_public_access"></a> [block\_public\_access](#input\_block\_public\_access) | n/a | `bool` | `true` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the account | `any` | n/a | yes |
| <a name="input_bucket_prefix"></a> [bucket\_prefix](#input\_bucket\_prefix) | Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket | `any` | `null` | no |
| <a name="input_cors_rule"></a> [cors\_rule](#input\_cors\_rule) | List of maps containing rules for Cross-Origin Resource Sharing. | `any` | `[]` | no |
| <a name="input_enable_current_object_expiration"></a> [enable\_current\_object\_expiration](#input\_enable\_current\_object\_expiration) | n/a | `bool` | `false` | no |
| <a name="input_enable_glacier_transition"></a> [enable\_glacier\_transition](#input\_enable\_glacier\_transition) | n/a | `bool` | `false` | no |
| <a name="input_enable_standard_ia_transition"></a> [enable\_standard\_ia\_transition](#input\_enable\_standard\_ia\_transition) | n/a | `bool` | `false` | no |
| <a name="input_expiration_days"></a> [expiration\_days](#input\_expiration\_days) | n/a | `number` | `90` | no |
| <a name="input_glacier_transition_days"></a> [glacier\_transition\_days](#input\_glacier\_transition\_days) | n/a | `number` | `90` | no |
| <a name="input_lifecycle_rule"></a> [lifecycle\_rule](#input\_lifecycle\_rule) | List of maps containing configuration of object lifecycle management. | `any` | `[]` | no |
| <a name="input_lifecycle_rule_enabled"></a> [lifecycle\_rule\_enabled](#input\_lifecycle\_rule\_enabled) | Enable lifecycle\_rule | `bool` | `false` | no |
| <a name="input_lifecycle_tags"></a> [lifecycle\_tags](#input\_lifecycle\_tags) | n/a | `any` | `null` | no |
| <a name="input_logging"></a> [logging](#input\_logging) | Bucket access logging configuration. | <pre>object({<br>    bucket_name = string<br>    prefix      = string<br>  })</pre> | `null` | no |
| <a name="input_override_json"></a> [override\_json](#input\_override\_json) | When using override\_json, the current policy document is overridden by the imported policy.Note that statement IDs (sid) have to match in order to actually override any statements. Otherwise they will be merged. | `string` | `""` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | lifecycle prefix | `any` | `null` | no |
| <a name="input_s3_kms_arn"></a> [s3\_kms\_arn](#input\_s3\_kms\_arn) | The optional kms for encryption . Defaults to s3 arn | `string` | `""` | no |
| <a name="input_server_side_encryption_configuration"></a> [server\_side\_encryption\_configuration](#input\_server\_side\_encryption\_configuration) | Map containing server-side encryption configuration. | `any` | `{}` | no |
| <a name="input_set_bucket_suffix"></a> [set\_bucket\_suffix](#input\_set\_bucket\_suffix) | n/a | `bool` | `false` | no |
| <a name="input_standard_transition_days"></a> [standard\_transition\_days](#input\_standard\_transition\_days) | n/a | `number` | `90` | no |
| <a name="input_versioning"></a> [versioning](#input\_versioning) | n/a | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_arn"></a> [bucket\_arn](#output\_bucket\_arn) | Bucket ARN |
| <a name="output_bucket_id"></a> [bucket\_id](#output\_bucket\_id) | Bucket Name (aka ID) |
| <a name="output_domain_name"></a> [domain\_name](#output\_domain\_name) | The bucket region-specific domain name.The AWS CloudFront allows specifying S3 region-specific endpoint when creating S3 origin, it will prevent redirect issues from CloudFront to S3 Origin URL. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

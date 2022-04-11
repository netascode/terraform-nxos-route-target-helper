<!-- BEGIN_TF_DOCS -->
[![Tests](https://github.com/netascode/terraform-nxos-route-target-helper/actions/workflows/test.yml/badge.svg)](https://github.com/netascode/terraform-nxos-route-target-helper/actions/workflows/test.yml)

# Terraform NXOS Route Target helper

Description

Translates Route Target values from NXOS CLI format to NX-OS DME model format. This module does not create any resources.

Translation examples:
```
route-target 65535:1      --> "route-target:as2-nn2:65535:1"
route-target 65536:1      --> "route-target:as4-nn2:65536:1"
route-target 1.1.1.1:1    --> "route-target:ipv4-nn2:1.1.1.1:1"
route-target auto         --> "route-target:unknown:0:0"
```

## Examples

```hcl
module "main" {
  source  = "netascode/route-target-helper/nxos"
  version = ">= 0.0.1"

  values = ["auto", "65535:1", "65536:1"]
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |

## Providers

No providers.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_values"></a> [values](#input\_values) | List of Route Target values. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_result"></a> [result](#output\_result) | Route Target in NX-OS DME format. |

## Resources

No resources.
<!-- END_TF_DOCS -->
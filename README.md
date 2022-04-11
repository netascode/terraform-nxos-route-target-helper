<!-- BEGIN_TF_DOCS -->
[![Tests](https://github.com/netascode/terraform-nxos-scaffolding/actions/workflows/test.yml/badge.svg)](https://github.com/netascode/terraform-nxos-scaffolding/actions/workflows/test.yml)

# Terraform NXOS Scaffolding Module

Description

Model Documentation: [Link](https://developer.cisco.com/docs/cisco-nexus-3000-and-9000-series-nx-api-rest-sdk-user-guide-and-api-reference-release-9-3x/#!configuring-an-ethernet-interface)

## Examples

```hcl
module "main" {
  source  = "netascode/route-target-helper/nxos"
  version = ">= 0.0.1"

  value = "65536:1"
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
| <a name="input_value"></a> [value](#input\_value) | Route Target value. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_result"></a> [result](#output\_result) | Route Target in NX-OS DME format. |

## Resources

No resources.
<!-- END_TF_DOCS -->
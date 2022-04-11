<!-- BEGIN_TF_DOCS -->
# Route Target Helper

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this example will create resources. Resources can be destroyed with `terraform destroy`.

```hcl
module "main" {
  source  = "netascode/route-target-helper/nxos"
  version = ">= 0.0.1"

  value = "65536:1"
}
```
<!-- END_TF_DOCS -->
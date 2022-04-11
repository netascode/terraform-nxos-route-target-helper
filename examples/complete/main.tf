module "main" {
  source  = "netascode/route-target-helper/nxos"
  version = ">= 0.0.1"

  value = "65536:1"
}

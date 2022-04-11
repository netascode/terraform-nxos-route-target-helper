module "main" {
  source  = "netascode/route-target-helper/nxos"
  version = ">= 0.0.1"

  values = ["auto", "65535:1", "65536:1"]
}

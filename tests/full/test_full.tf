terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }
  }
}

locals {
  test_values = { "auto" : "route-target:unknown:0:0",
    "1.1.1.1:1" : "route-target:ipv4-nn2:1.1.1.1:1",
    "65535:1" : "route-target:as2-nn2:65535:1",
    "65536:1" : "route-target:as4-nn2:65536:1",
  }
}

module "main" {
  source   = "../.."
  for_each = local.test_values
  value    = each.key
}

resource "test_assertions" "rd_check" {
  component = "RD"

  equal "test1" {
    description = "check rd auto"
    got         = module.main["auto"].result
    want        = local.test_values["auto"]
  }

  equal "test2" {
    description = "check rd 1.1.1.1:1"
    got         = module.main["1.1.1.1:1"].result
    want        = local.test_values["1.1.1.1:1"]
  }

  equal "test3" {
    description = "check rd 65535:1"
    got         = module.main["65535:1"].result
    want        = local.test_values["65535:1"]
  }

  equal "test4" {
    description = "check rd 65536:1"
    got         = module.main["65536:1"].result
    want        = local.test_values["65536:1"]
  }
}

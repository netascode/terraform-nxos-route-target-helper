terraform {
  required_version = ">= 1.0.0"

  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }
  }
}

locals {
  test_map = { "auto" : "route-target:unknown:0:0",
    "1.1.1.1:1" : "route-target:ipv4-nn2:1.1.1.1:1",
    "65535:1" : "route-target:as2-nn2:65535:1",
    "65536:1" : "route-target:as4-nn2:65536:1",
  }
  test = [for key, value in local.test_map : key]
  want = [for key, value in local.test_map : value]
}

module "main" {
  source = "../.."
  values = local.test
}

resource "test_assertions" "rd_check" {
  component = "Route-target"

  equal "test1" {
    description = "check route-target"
    got         = module.main.result
    want        = local.want
  }
}

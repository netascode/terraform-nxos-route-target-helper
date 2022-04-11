terraform {
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
  # for_each = local.test_values
  values = local.test
}

resource "test_assertions" "rd_check" {
  component = "Route-target"

  equal "test1" {
    description = "check route-target"
    got         = module.main.result
    want        = local.want
  }

  # equal "test2" {
  #   description = "check route-target 1.1.1.1:1"
  #   got         = module.main["1.1.1.1:1"].result
  #   want        = local.test_values["1.1.1.1:1"]
  # }

  # equal "test3" {
  #   description = "check route-target 65535:1"
  #   got         = module.main["65535:1"].result
  #   want        = local.test_values["65535:1"]
  # }

  # equal "test4" {
  #   description = "check route-target 65536:1"
  #   got         = module.main["65536:1"].result
  #   want        = local.test_values["65536:1"]
  # }
}

/*
vrf context foo
  rd 65535:1      --> "rd": "rd:as2-nn2:65535:1",

vrf context foo
  rd rd 65536:1   --> "rd": "rd:as4-nn2:65536:1",

vrf context foo
  rd 1.1.1.1:1    --> "rd": "rd:ipv4-nn2:1.1.1.1:1",

vrf context foo
  rd auto         --> "rd": "rd:unknown:0:0",

vrf context foo
  no rd           --> "rd": "unknown:unknown:0:0",
*/

locals {
  format_auto = var.value == "auto" ? true : false
  format_ipv4 = can(regex("\\.", var.value)) ? true : false
  format_as2  = !can(regex("\\.", var.value)) && can(regex(":", var.value)) ? (tonumber(split(":", var.value)[0]) <= 65535 ? true : false) : false
  format_as4  = !can(regex("\\.", var.value)) && can(regex(":", var.value)) ? (tonumber(split(":", var.value)[0]) >= 65536 ? true : false) : false

  result = local.format_auto ? "route-target:unknown:0:0" : (
    local.format_ipv4 ? "route-target:ipv4-nn2:${var.value}" : (
      local.format_as2 ? "route-target:as2-nn2:${var.value}" : (
        local.format_as4 ? "route-target:as4-nn2:${var.value}" : "unexpected_rt_format"
  )))
}

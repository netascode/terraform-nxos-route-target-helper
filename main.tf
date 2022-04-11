locals {
  foo = [for value in var.values : {
    "format_auto" = value == "auto" ? true : false
    "format_ipv4" = can(regex("\\.", value)) ? true : false
    "format_as2"  = !can(regex("\\.", value)) && can(regex(":", value)) ? (tonumber(split(":", value)[0]) <= 65535 ? true : false) : false
    "format_as4"  = !can(regex("\\.", value)) && can(regex(":", value)) ? (tonumber(split(":", value)[0]) >= 65536 ? true : false) : false
    "value"       = value
    }
  ]

  result = [for entry in local.foo :
    entry.format_auto ? "route-target:unknown:0:0" : (
      entry.format_ipv4 ? "route-target:ipv4-nn2:${entry.value}" : (
        entry.format_as2 ? "route-target:as2-nn2:${entry.value}" : (
          entry.format_as4 ? "route-target:as4-nn2:${entry.value}" : "unexpected_rt_format"
    )))
  ]
}

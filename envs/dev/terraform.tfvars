clients = [
  "k8s-dd"
]

servers = [
  "k8s-dd",
  "k8s-ez"
]

hosted_zone_id = "/hostedzone/Z08408432FPT8110RNMJ1"

lambda_env = {
  DYNDNS_HOSTED_ZONE_ID = "Z08408432FPT8110RNMJ1"
  DYNDNS_KNOWN_HOSTS    = "{\"dd.dc.soeren.cloud\":[\"hU0+O/QDU4tViikho4wLeD+FsrZawh5nDBcKDSQp0uc=\",\"3w/t9jI4L3/SrpFYA7N5Jwx7m0PgEhv/GTQPtn4fd+0=\"],\"ez.dc.soeren.cloud\":[\"TApMohc2KZN+kEhv5XWA88qW5DyHxf3jInv78wx4RLE=\",\"Lp7QFK2U6yhY25thPT5H+sZxw2COcy8mWE+3KJhsgXk=\"],\"pt.dc.soeren.cloud\":[\"KwpqFiE0KmWCJdHV0MIefX9RiZW4fk3VPL/DdwLtilM=\",\"RHUYdhUZjE1eDoq8viiKlbCZc40lpiNljWE9QLBxlgw=\"]}"
}

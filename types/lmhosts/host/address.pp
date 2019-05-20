# @summary
#   One or more Ipv4 addresses.
#
type Samba::Lmhosts::Host::Address = Variant[
  Array[Stdlib::IP::Address::V4::Nosubnet,2],
]

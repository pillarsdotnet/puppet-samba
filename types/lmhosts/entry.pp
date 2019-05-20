# @summary
#   An Lmhosts entry may be a host, an include, or a list of alternates.
#
type Samba::Lmhosts::Entry = Variant[
  Samba::Lmhosts::Alternates::Resource,
  Samba::Lmhosts::Host::Resource,
  Samba::Lmhosts::Include::Resource,
]

# @summary
#   An include path can either a local file path or a UNC path.
#
type Samba::Lmhosts::Include::Path = Variant[
  Stdlib::Absolutepath,
  Samba::Lmhosts::UNC,
]

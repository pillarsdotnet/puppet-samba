# @summary
#   An include contains either a local file path or a UNC path.
#
type Samba::Lmhosts::Include::Resource = Struct[
  {
    include         => Samba::Lmhosts::Include::Path,
    Optional[index] => Samba::Lmhosts::Order,
    Optional[path]  => Stdlib::Absolutepath,
  }
]

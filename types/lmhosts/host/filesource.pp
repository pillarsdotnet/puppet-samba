# @summary
#   A local or remote file path.
#
type Samba::Lmhosts::Filesource = Variant[
  Stdlib::Absolutepath,
  Samba::Lmhosts::UNC,
]
# @summary
#   One more more files or UNC paths.
#
type Samba::Lmhosts::Include = Variant[
  Samba::Lmhosts::Filesource,
  Array[Samba::Lmhosts::Filesource,2]
]
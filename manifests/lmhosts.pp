# @summary Manage the /etc/samba/lmhosts file.
#
# This class manages entries within the Samba lmhosts file, based on documentation
# found at http://bit.ly/2L2zaYJ
#
# @example
#   include samba::lmhosts
#
# @param [Samba::Lmhosts::List] list
#   Ordered List of lmhosts entries.
#
# @param [Boolean] no_export
#   If true, do not export the current host for use by other nodes.
#
# @param [Boolean] no_import
#   If true, do not add exported host entries to this node's lmhosts file.
#
# @param [Stdlib::Absolutepath] path
#   Absolute path to the lmhosts file to manage.
#
class samba::lmhosts(
  Samba::Lmhosts::List $list      = [],
  Stdlib::Absolutepath $path      = '/etc/lmhosts',
){
  # Create the lmhosts file.
  concat { $path:
    ensure => 'present',
  }

  # Add static hosts not in the catalog.
  $list.each |Integer[1] $index, Samba::Lmhosts::Entry $entry| {
    $type = $entry ? {
      Samba::Lmhosts::Alternates::Resource => 'samba::lmhosts::alternates',
      Samba::Lmhosts::Host::Resource       => 'samba::lmhosts::host',
      Samba::Lmhosts::Include::Resource    => 'samba::lmhosts::include',
    }
    $order = String($index, '%04d')
    create_resources($type, { "${path} ${order}" => $entry })
  }
}

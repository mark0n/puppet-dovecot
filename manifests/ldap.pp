#
class dovecot::ldap (
  String $package_name,
) {
  include ::dovecot

  contain ::dovecot::ldap::install
}

#
class dovecot::ldap::install inherits dovecot::ldap {
  if $dovecot::package_manage {
    package {$dovecot::ldap::package_name:
      ensure => $dovecot::package_ensure,
    }
  }
}

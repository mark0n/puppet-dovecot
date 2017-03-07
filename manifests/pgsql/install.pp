#
class dovecot::pgsql::install inherits dovecot::pgsql {
  if $dovecot::package_manage {
    package {$dovecot::pgsql::package_name:
      ensure => $dovecot::package_ensure,
    }
  }
}

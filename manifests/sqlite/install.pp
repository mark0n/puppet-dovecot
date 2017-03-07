#
class dovecot::sqlite::install inherits dovecot::sqlite {
  if $dovecot::package_manage {
    package {$dovecot::sqlite::package_name:
      ensure => $dovecot::package_ensure,
    }
  }
}

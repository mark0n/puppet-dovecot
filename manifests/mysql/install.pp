#
class dovecot::mysql::install inherits dovecot::mysql {
  if $dovecot::package_manage {
    package {$dovecot::mysql::package_name:
      ensure => $dovecot::package_ensure,
    }
  }
}

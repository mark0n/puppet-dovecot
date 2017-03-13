#
class dovecot::pop3::install inherits dovecot::pop3 {
  if $dovecot::package_manage {
    package {$dovecot::pop3::package_name:
      ensure => $dovecot::package_ensure,
    }
  }
}

#
class dovecot::lmtp::install inherits dovecot::lmtp {
  if $dovecot::package_manage {
    package {$dovecot::lmtp::package_name:
      ensure => $dovecot::package_ensure,
    }
  }
}

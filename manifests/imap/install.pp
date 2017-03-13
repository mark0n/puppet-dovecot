#
class dovecot::imap::install inherits dovecot::imap {
  if $dovecot::package_manage {
    package {$dovecot::imap::package_name:
      ensure => $dovecot::package_ensure,
    }
  }
}

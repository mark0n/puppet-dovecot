#
class dovecot::managesieved::install inherits dovecot::managesieved {
  if $dovecot::package_manage {
    package {$dovecot::managesieved::package_name:
      ensure => $dovecot::package_ensure,
    }
  }
}

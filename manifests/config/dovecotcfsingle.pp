# one single dovecot config file change
define dovecot::config::dovecotcfsingle(
  $ensure      = present,
  $config_file = 'dovecot.conf',
  $option      = $name,
  $value       = undef,
) {
  Augeas {
    context => "/files/${dovecot::config_dir}/${config_file}",
    notify  => Class['dovecot::service'],
  }

  case $ensure {
    present: {
      if !$value {
        fail("dovecot ${dovecot::config_dir}/${config_file} ${option} value not set")
      }
      augeas { "dovecot ${dovecot::config_dir}/${config_file} ${option}":
        changes => "set ${option} '${value}'",
      }
    }

    absent: {
      augeas { "dovecot ${dovecot::config_dir}/${config_file} ${option}":
        changes => "rm ${option}",
      }
    }
    default : {
      notice('unknown ensure value use absent or present')
    }
  }
}

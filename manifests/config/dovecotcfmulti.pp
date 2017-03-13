# multiple dovecot config file changes at once
define dovecot::config::dovecotcfmulti(
  $config_file='dovecot.conf',
  $changes=undef,
  $onlyif=undef,
) {
  Augeas {
    context => "/files${dovecot::config_dir}/${config_file}",
    notify  => Class['dovecot::service'],
  }

  augeas { "dovecot ${dovecot::config_dir}/${config_file} ${name}":
    changes => $changes,
    onlyif  => $onlyif,
  }
}

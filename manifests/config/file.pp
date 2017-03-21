#
define dovecot::config::file (
  Enum['present','absent'] $ensure = 'present',
  Optional[String] $source         = undef,
  Optional[String] $content        = undef,
  Optional[String] $path           = undef,
  String $owner                    = 'root',
  String $group                    = 'root',
  String $mode                     = '0644',
) {
  $f_path = $path ? {
    undef   => "${dovecot::config_dir}/conf.d/${name}",
    default => $path
  }

  file {$f_path:
    ensure  => $ensure,
    owner   => $owner,
    group   => $group,
    mode    => $mode,
    source  => $source,
    content => $content,
    notify  => Class['dovecot::service'],
  }
}

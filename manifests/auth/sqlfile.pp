#
define dovecot::auth::sqlfile (
  Enum['mysql','pgsql','sqlite'] $driver,
  String $connect,
  String $owner                         = 'root',
  String $group                         = 'root',
  String $mode                          = '0600',
  Optional[String] $default_pass_scheme = undef,
  Optional[String] $password_query      = undef,
  Optional[String] $user_query          = undef,
  Optional[String] $iterate_query       = undef,
) {

  case $driver {
    'mysql': { include ::dovecot::mysql }
    'pgsql': { include ::dovecot::pgsql }
    'sqlite': { include ::dovecot::sqlite }
    default: { fail("SQL driver ${driver} not supported") }
  }

  file {$name:
    owner   => $owner,
    group   => $group,
    mode    => $mode,
    notify  => Class['::dovecot::service'],
    content => epp('dovecot/auth/dovecot-sql.epp', {
      driver              => $driver,
      connect             => $connect,
      default_pass_scheme => $default_pass_scheme,
      password_query      => $password_query,
      user_query          => $user_query,
      iterate_query       => $iterate_query,
    }),
  }
}

#
define dovecot::auth::userdb (
  Dovecot::Database $driver,
  String $order                                                   = '70',
  Optional[String] $args                                          = undef,
  Optional[String] $default_fields                                = undef,
  Optional[String] $override_fields                               = undef,
  Optional[Enum['never','found','notfound']] $skip = undef,
  Optional[Dovecot::Result] $result_failure                       = undef,
  Optional[Dovecot::Result] $result_internalfail                  = undef,
  Optional[Dovecot::Result] $result_success                       = undef,
  Optional[Enum['default','yes','no']] $auth_verbose              = undef,
) {
  concat::fragment {"userdb ${name}":
    order   => $order,
    target  => "${dovecot::config_dir}/conf.d/auth-databases.conf.ext",
    content => epp('dovecot/auth/userdb.epp', {
        driver              => $driver,
        args                => $args,
        default_fields      => $default_fields,
        override_fields     => $override_fields,
        skip                => $skip,
        result_failure      => $result_failure,
        result_internalfail => $result_internalfail,
        result_success      => $result_success,
        auth_verbose        => $auth_verbose,
    }),
  }
}

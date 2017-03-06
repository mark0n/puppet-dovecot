#
define dovecot::auth::passdb (
  Dovecot::Database $driver,
  String $order                                                   = '50',
  Optional[String] $args                                          = undef,
  Optional[String] $default_fields                                = undef,
  Optional[String] $override_fields                               = undef,
  Optional[Enum['yes','no']] $deny                                = undef,
  Optional[Enum['yes','no']] $master                              = undef,
  Optional[Enum['yes','no']] $pass                                = undef,
  Optional[Enum['never','authenticated','unauthenticated']] $skip = undef,
  Optional[Dovecot::Result] $result_failure                       = undef,
  Optional[Dovecot::Result] $result_internalfail                  = undef,
  Optional[Dovecot::Result] $result_success                       = undef,
  Optional[Enum['default','yes','no']] $auth_verbose              = undef,
) {
  concat::fragment {"passdb $name":
    order                 => $order,
    target                => '/etc/dovecot/conf.d/auth-databases.conf.ext',
    content               => epp('dovecot/auth/passdb.epp', {
      driver              => $driver,
      args                => $args,
      default_fields      => $default_fields,
      override_fields     => $override_fields,
      deny                => $deny,
      master              => $master,
      pass                => $pass,
      skip                => $skip,
      result_failure      => $result_failure,
      result_internalfail => $result_internalfail,
      result_success      => $result_success,
      auth_verbose        => $auth_verbose,
    })
  }
}

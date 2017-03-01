#
class dovecot::service inherits dovecot {
  if $dovecot::service_manage == true {
    service {'dovecot':
      ensure     => $dovecot::service_ensure,
      enable     => $dovecot::service_enable,
      name       => $dovecot::service_name,
      provider   => $dovecot::service_provider,
      hasstatus  => true,
      hasrestart => true,
    }
  }
}

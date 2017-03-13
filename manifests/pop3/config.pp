#
class dovecot::pop3::config {
  dovecot::config::dovecotcfhash {'pop3':
    config_file => 'conf.d/20-pop3.conf',
    options     => merge( $dovecot::pop3::options, prefix($dovecot::pop3::protocol_options, "protocol[. = \"pop3\"]/") ),
  }

  dovecot::master::service {'pop3':
    ensure  => 'present',
    options => $dovecot::pop3::service_options,
  }

  dovecot::master::service {'pop3-login':
    ensure  => 'present',
    options => $dovecot::pop3::login_options,
  }

  # Configure inet_listeners included in $inet_listeners
  $dovecot::pop3::inet_listeners.each |String $k, Hash $opt| {
    dovecot::pop3::inet_listener {$k:
      * => $opt,
    }
  }
}

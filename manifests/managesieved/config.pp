#
class dovecot::managesieved::config {
  dovecot::master::service {'managesieve-login':
    ensure      => 'present',
    config_file => 'conf.d/20-managesieve.conf',
    options     => $dovecot::managesieved::login_options,
  }

  # Configure inet_listeners for managesieve
  $dovecot::managesieved::inet_listeners.each |String $k, Hash $opt| {
    dovecot::managesieved::inet_listener {$k:
      * => $opt,
    }
  }

  dovecot::master::service {'managesieve':
    ensure      => 'present',
    config_file => 'conf.d/20-managesieve.conf',
    options     => $dovecot::managesieved::service_options,
  }

  dovecot::config::dovecotcfhash {'managesieve':
    config_file => 'conf.d/20-managesieve.conf',
    options     => merge( $dovecot::managesieved::options, prefix($dovecot::managesieved::protocol_options, "protocol[. =\"sieve\"]/") ),
  }
}

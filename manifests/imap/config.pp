#
class dovecot::imap::config {
  dovecot::config::dovecotcfhash {'imap':
    config_file => 'conf.d/20-imap.conf',
    options     => merge( $dovecot::imap::options, prefix($dovecot::imap::protocol_options, "protocol[. = \"imap\"]/") ),
  }

  dovecot::master::service {'imap':
    ensure  => 'present',
    options => $dovecot::imap::service_options,
  }

  dovecot::master::service {'imap-login':
    ensure  => 'present',
    options => $dovecot::imap::login_options,
  }

  # Configure inet_listeners included in $inet_listeners
  $dovecot::imap::inet_listeners.each |String $k, Hash $opt| {
    dovecot::imap::inet_listener {$k:
      * => $opt,
    }
  }
}

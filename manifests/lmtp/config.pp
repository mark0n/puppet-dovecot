#
class dovecot::lmtp::config {
  dovecot::config::dovecotcfhash {'lmtp':
    config_file => 'conf.d/20-lmtp.conf',
    options     => merge( $dovecot::lmtp::options, prefix($dovecot::lmtp::protocol_options, "protocol[. = \"lmtp\"]/") ),
  }

  dovecot::master::service {'lmtp':
    ensure  => 'present',
  }

  # Configure inet_listeners included in $inet_listeners
  $dovecot::lmtp::inet_listeners.each |String $k, Hash $opt| {
    dovecot::lmtp::inet_listener {$k:
      * => $opt,
    }
  }

  # Configure unix_listeners included in $unix_listeners
  $dovecot::lmtp::unix_listeners.each |String $k, Hash $opt| {
    dovecot::lmtp::unix_listener {$k:
      * => $opt,
    }
  }
}

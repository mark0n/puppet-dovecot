#
# Internal define to configure services in the 10-master config file
define dovecot::master::service (
  Enum['present','absent'] $ensure = 'present',
  Hash[String, Optional[Variant[String,Integer]]] $options = {},
  Hash[String, Hash] $inet_listeners = {},
  Hash[String, Hash] $unix_listeners = {},
  Hash[String, Hash] $fifo_listeners = {},
  String $config_file = 'conf.d/10-master.conf',
) {
  if $ensure == 'present' {
    dovecot::config::dovecotcfmulti {"service ${name}":
      config_file => $config_file,
      onlyif      => "values service not_include ${name}",
      changes     => [ "set service[last()+1] ${name}", ],
    }

    dovecot::config::dovecotcfhash {"service ${name} options":
      config_file => $config_file,
      options     => prefix($options, "service[. = \"${name}\"]/"),
      require     => Dovecot::Config::Dovecotcfmulti["service ${name}"],
    }

    # Configure inet_listeners included in $inet_listeners
    $inet_listeners.each |String $k, Hash $opt| {
      dovecot::config::listener {$k:
        ensure        => $ensure,
        type          => 'inet',
        service       => $name,
        listener_name => $k,
        options       => $opt,
      }
    }

    # Configure unix_listeners included in $unix_listeners
    $unix_listeners.each |String $k, Hash $opt| {
      dovecot::config::listener {$k:
        ensure        => $ensure,
        type          => 'unix',
        service       => $name,
        listener_name => $k,
        options       => $opt,
      }
    }

    # Configure fifo_listeners included in $fifo_listeners
    $fifo_listeners.each |String $k, Hash $opt| {
      dovecot::config::listener {$k:
        ensure        => $ensure,
        type          => 'fifo',
        service       => $name,
        listener_name => $k,
        options       => $opt,
      }
    }
  } else {
    dovecot::config::dovecotcfmulti {"remove service ${name}":
      config_file => $config_file,
      onlyif      => "values service include ${name}",
      changes     => [ "rm service[. = \"${name}\"]", ],
    }
  }
}

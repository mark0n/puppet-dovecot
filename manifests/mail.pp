# 10-mail.conf
# See README.md for usage
class dovecot::mail (
  Hash[String, Optional[String]] $options,
  Hash $namespace,
) {
  dovecot::config::dovecotcfhash {'mail':
    config_file => 'conf.d/10-mail.conf',
    options     => $options,
  }

  $namespace.each |$name, $opts| {
    dovecot::namespace {$name:
      * => $opts,
    }
  }
}

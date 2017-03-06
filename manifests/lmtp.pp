# 20-lmtp.conf
class dovecot::lmtp (
  Hash[String, Optional[Variant[String,Integer]]] $options,
  Hash[String, Optional[Variant[String,Integer]]] $protocol_options,
  Hash[String, Hash]                              $inet_listeners,
  Hash[String, Hash]                              $unix_listeners,
  String $package_name,
) {
  include ::dovecot

  contain ::dovecot::lmtp::install
  contain ::dovecot::lmtp::config

  Class['::dovecot::lmtp::install'] ->
  Class['::dovecot::lmtp::config'] ~>
  Class['::dovecot::service']
}

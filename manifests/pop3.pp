# 20-pop3.conf
# See README.md for usage
class dovecot::pop3 (
  Hash[String, Optional[Variant[String,Integer]]] $options,
  Hash[String, Optional[Variant[String,Integer]]] $protocol_options,
  Hash[String, Optional[Variant[String,Integer]]] $service_options,
  Hash[String, Optional[Variant[String,Integer]]] $login_options,
  Hash[String, Hash]                              $inet_listeners,
  String $package_name,
) {
  include ::dovecot

  contain ::dovecot::pop3::install
  contain ::dovecot::pop3::config

  Class['::dovecot::pop3::install'] ->
  Class['::dovecot::pop3::config'] ~>
  Class['::dovecot::service']
}

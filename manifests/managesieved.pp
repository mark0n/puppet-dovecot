# 20-managesieve.conf
# See README.md for usage
class dovecot::managesieved (
  Hash[String, Optional[Variant[String,Integer]]] $options,
  Hash[String, Optional[Variant[String,Integer]]] $protocol_options,
  Hash[String, Optional[Variant[String,Integer]]] $service_options,
  Hash[String, Optional[Variant[String,Integer]]] $login_options,
  Hash[String, Hash]                              $inet_listeners,
  String $package_name,
) {
  include ::dovecot

  contain ::dovecot::managesieved::install
  contain ::dovecot::managesieved::config

  Class['::dovecot::managesieved::install'] ->
  Class['::dovecot::managesieved::config'] ~>
  Class['::dovecot::service']
}

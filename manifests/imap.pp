# 20-imap.conf
# See README.md for usage
class dovecot::imap (
  Hash[String, Optional[Variant[String,Integer]]] $options,
  Hash[String, Optional[Variant[String,Integer]]] $protocol_options,
  Hash[String, Optional[Variant[String,Integer]]] $service_options,
  Hash[String, Optional[Variant[String,Integer]]] $login_options,
  Hash[String, Hash]                              $inet_listeners,
  String $package_name,
) {
  include ::dovecot

  contain ::dovecot::imap::install
  contain ::dovecot::imap::config

  Class['::dovecot::imap::install'] ->
  Class['::dovecot::imap::config'] ~>
  Class['::dovecot::service']
}

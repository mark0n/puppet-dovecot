# dovecot class
class dovecot(
  String $package_ensure,
  Boolean $package_manage,
  Array[String] $package_name,
  Boolean $service_enable,
  Enum['running','stopped'] $service_ensure,
  Boolean $service_manage,
  String $service_name,
  Optional[String] $service_provider,
  Stdlib::Absolutepath $config_dir,
  Boolean $enable_imap,
  Boolean $enable_pop3,
  Boolean $enable_lmtp,
  Boolean $enable_managesieved,
  Hash $plugins,
  Hash $files,
) {
  contain ::dovecot::install
  contain ::dovecot::config
  contain ::dovecot::service

  Class['::dovecot::install'] ->
  Class['::dovecot::config'] ~>
  Class['::dovecot::service']
}

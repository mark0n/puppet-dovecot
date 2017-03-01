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
) {
  contain ::dovecot::install
  contain ::dovecot::service

  Class['::dovecot::install'] ->
  Class['::dovecot::service']
}

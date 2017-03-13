#
class dovecot::mysql (
  String $package_name,
) {
  include ::dovecot

  contain ::dovecot::mysql::install
}

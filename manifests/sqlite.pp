#
class dovecot::sqlite (
  String $package_name,
) {
  include ::dovecot

  contain ::dovecot::sqlite::install
}

#
class dovecot::pgsql (
  String $package_name,
) {
  include ::dovecot

  contain ::dovecot::pgsql::install
}

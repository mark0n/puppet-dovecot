#
class dovecot::config inherits dovecot {
  if $dovecot::enable_auth == true {
    contain ::dovecot::auth
  }

  if $dovecot::enable_logging == true {
    contain ::dovecot::logging
  }

  if $dovecot::enable_mail == true {
    contain ::dovecot::mail
  }

  if $dovecot::enable_master == true {
    contain ::dovecot::master
  }

  if $dovecot::enable_lda == true {
    contain ::dovecot::lda
  }

  if $dovecot::enable_imap == true {
    contain ::dovecot::imap
  }

  if $dovecot::enable_pop3 == true {
    contain ::dovecot::pop3
  }

  if $dovecot::enable_lmtp == true {
    contain ::dovecot::lmtp
  }

  if $dovecot::enable_managesieved == true {
    contain ::dovecot::managesieved
  }

  if $dovecot::enable_ssl == true {
    contain ::dovecot::ssl
  }

  $dovecot::plugins.each |$name, $opts| {
    dovecot::plugin {$name:
      * => $opts,
    }
  }

  $dovecot::files.each |$name, $opts| {
    dovecot::config::file {$name:
      * => $opts,
    }
  }
}

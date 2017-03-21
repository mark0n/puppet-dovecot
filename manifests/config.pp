#
class dovecot::config inherits dovecot {
  contain ::dovecot::auth
  contain ::dovecot::logging
  contain ::dovecot::mail
  contain ::dovecot::master
  contain ::dovecot::lda
  contain ::dovecot::ssl

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

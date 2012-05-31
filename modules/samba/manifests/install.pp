
class samba::install {

  package { $samba::params::package :
    ensure => installed
  }

}



class avahi::install {

  package { $avahi::params::package :
    ensure => installed
  }

}



class netatalk::install {

  package { $netatalk::params::package :
    ensure => installed
  }

}


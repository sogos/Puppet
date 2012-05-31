
class phpmyadmin::install {

  package { $phpmyadmin::params::package :
    ensure => latest
  }

}


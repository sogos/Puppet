
class avahi::service {

  include avahi::params
  include avahi::install
  include avahi::config

  service { $avahi::params::service :
    ensure     => running,
    enable     => true,
    hasstatus  => false,
    hasrestart => true,
    require    => [Class["avahi::install"], Class["avahi::config"]],
    pattern    => afpd
  }

}


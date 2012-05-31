
class netatalk::service {

  include netatalk::params
  include netatalk::install
  include netatalk::config

  service { $netatalk::params::service :
    ensure     => running,
    enable     => true,
    hasstatus  => false,
    hasrestart => true,
    require    => [Class["netatalk::install"], Class["netatalk::config"]],
    pattern    => afpd
  }

}



class samba::service {

  include samba::params
  include samba::install
  include samba::config

  service { $samba::params::service :
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => [Class["samba::install"], Class["samba::config"]],
    pattern    => smbd
  }


  service { $samba::params::service_associated :
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => [Class["samba::install"], Class["samba::config"]],
    pattern    => nmbd
  }


}


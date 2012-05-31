
class nginx::service {

  include nginx::params
  include nginx::install
  include nginx::config

  service { $nginx::params::service :
    ensure     => running,
    enable     => true,
    hasstatus  => false,
    hasrestart => true,
    require    => [Class["nginx::install"], Class["nginx::config"]],
    pattern    => nginx
  }


 service { $nginx::params::service_phpfpm :
    ensure     => running,
    enable     => true,
    hasstatus  => false,
    hasrestart => true,
    require    => [Class["nginx::install"], Class["nginx::config"]],
    pattern    => php-fpm
  }


}


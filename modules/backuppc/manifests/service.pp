
class backuppc::service {

  include backuppc::params
  include backuppc::install
  include backuppc::config

  service { $backuppc::params::service :
    ensure     => running,
    enable     => true,
    hasstatus  => false,
    hasrestart => true,
    require    => [Class["backuppc::install"], Class["backuppc::config"]],
    pattern    => afpd
  }



}


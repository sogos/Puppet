
class backuppc::params {

  $package = $operatingsystem ? {
    default => BackupPC
  }

 
  $service = $operatingsystem ? {
    default => backuppc
  }


  file {"/etc/httpd/conf.d/BackupPC.conf":
	  owner  => 'root',
		 group  => 'root',
		 mode   =>  0644,
		 content=> template("/etc/puppet/modules/backuppc/templates/BackupPC.conf.erb"),
	  notify => [Exec["apache-graceful"],Class["backuppc::service"]],
	  require => Class["backuppc::install"],
  }

}


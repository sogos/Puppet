class backuppC::install {

  package { $backuppc::params::package :
    ensure => installed
  }


  exec { '/bin/mv /var/lib/BackupPC /home/Backups/BackupPC':
	  onlyif => ["/usr/bin/test ! -L /var/lib/BackupPC"]
  }

  file { '/var/lib/BackupPC':
	  ensure => 'link',
		 target => '/home/Backups/BackupPC',
  }


}

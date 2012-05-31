
class avahi::params {

  $package = $operatingsystem ? {
    default => avahi
  }
 
  $service = $operatingsystem ? {
    default => avahi-daemon
  }


  file {"/etc/avahi/services/afpd.service":
	  owner  => 'root',
		 group  => 'root',
		 mode   =>  0644,
		 content=> template("/etc/puppet/modules/avahi/templates/afpd.service.erb"),
	  notify => Class["avahi::service"],
	  require => Class["netatalk::install"],
  }

  file {"/etc/avahi/services/samba.service":
          owner  => 'root',
                 group  => 'root',
                 mode   =>  0644,
                 content=> template("/etc/puppet/modules/avahi/templates/samba.service.erb"),
          notify => Class["avahi::service"],
          require => Class["samba::install"],
  }


}


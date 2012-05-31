
class netatalk::params {

  $package = $operatingsystem ? {
    default => netatalk
  }
  $package_avahi = $operatingsystem ? {
    default => avahi
  }

 
  $service = $operatingsystem ? {
    default => netatalk
  }


  file {"/etc/netatalk/afpd.conf":
	  owner  => 'root',
		 group  => 'root',
		 mode   =>  0644,
		 content=> template("/etc/puppet/modules/netatalk/templates/afpd.erb"),
	  notify => Class["netatalk::service"],
	  require => Class["netatalk::install"],
  }

#  file {"/etc/netatalk/AppleVolumes.default":
#	  owner  => 'root',
#		 group  => 'root',
#		 mode   =>  0644,
#		 content=> template("/etc/puppet/modules/netatalk/templates/AppleVolumes.default.erb"),
#	  notify => Class["netatalk::service"],
#	  require => Class["netatalk::install"],
#  }


     $netatalk_config_dir = $operatingsystem ? {
                'CentOS'        => "/etc/netatalk",
                default         => "/etc/netatalk",
        }

        $netatalk_config = "$netatalk_config_dir/afpd.conf"
        $netatalk_share_file = "$netatalk_config_dir/AppleVolumes.default"





}


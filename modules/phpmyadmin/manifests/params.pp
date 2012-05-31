
class phpmyadmin::params {

  $package = $operatingsystem ? {
    default => phpMyAdmin
  }

include apache

  file {"/etc/httpd/conf.d/phpMyAdmin.conf":
	  owner  => 'root',
		 group  => 'root',
		 mode   =>  0644,
		 content=> template("/etc/puppet/modules/phpmyadmin/templates/phpMyAdmin.conf.erb"),
	  notify => Exec["apache-graceful"],
#	  require => Class["apache::base"],
  }


}


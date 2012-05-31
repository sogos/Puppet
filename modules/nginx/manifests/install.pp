
class nginx::install {

  package { $nginx::params::package :
    ensure => installed
  }

 package { $nginx::params::package_php :
    ensure => latest,
	    notify => Class["nginx::service"]
  }



 package { $nginx::params::package_phpfpm :
    ensure => latest,
	    notify => Class["nginx::service"]

  }

 package { $nginx::params::package_yum_priorities :
    ensure => installed
  }

exec { '/bin/rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm' :
	          creates => ["/etc/yum.repos.d/remi.repo"]
 }

file {"/etc/yum.repos.d/remi.repo":
	owner  => 'root',
	       group  => 'root',
	       mode   =>  0644,
	       content=> template("/etc/puppet/modules/nginx/templates/remi.repo.erb"),
}



}


class nginx::params {

  $package = $operatingsystem ? {
    default => nginx
  }
  $package_phpfpm = $operatingsystem ? {
          default => php-fpm
  }
  $package_php = $operatingsystem ? {
          default => php
  }

  $package_yum_priorities = $operatingsystem ? {
          default => yum-plugin-priorities
  }

  $service = $operatingsystem ? {
    default => nginx
  }

  $service_phpfpm = $operatingsystem ? {
    default => php-fpm
  }



  file {"/etc/nginx/nginx.conf":
	  owner  => 'root',
		 group  => 'root',
		 mode   =>  0644,
		 content=> template("/etc/puppet/modules/nginx/templates/nginx.conf.erb"),
		 notify => Class["nginx::service"],
		 require => Class["nginx::install"],
  }

  file {"/etc/nginx/conf.d/ssl.conf":
	  owner  => 'root',
		 group  => 'root',
		 mode   =>  0644,
		 content=> template("/etc/puppet/modules/nginx/templates/ssl.conf.erb"),
		 notify => Class["nginx::service"],
		 require => Class["nginx::install"],
  }


  file {"/etc/pki/tls/certs/box.cert":
          owner  => 'root',
                 group  => 'root',
                 mode   =>  0644,
                 content=> template("/etc/puppet/modules/nginx/templates/box.cert.erb"),
                 notify => Class["nginx::service"],
                 require => Class["nginx::install"],
  }

  file {"/etc/pki/tls/certs/CA_ROOT.pem":
          owner  => 'root',
                 group  => 'root',
                 mode   =>  0644,
                 content=> template("/etc/puppet/modules/nginx/templates/CA_ROOT.pem.erb"),
                 notify => Class["nginx::service"],
                 require => Class["nginx::install"],
  }

  file {"/etc/pki/tls/private/private-key.key":
          owner  => 'root',
                 group  => 'root',
                 mode   =>  0644,
                 content=> template("/etc/puppet/modules/nginx/templates/private-key.key.erb"),
                 notify => Class["nginx::service"],
                 require => Class["nginx::install"],
  }

  file {"/etc/pki/tls/certs/dbbox-chain.pem":
	  owner  => 'root',
		 group  => 'root',
		 mode   =>  0644,
		 content=> template("/etc/puppet/modules/nginx/templates/dbbox-chain.pem.erb"),
		 notify => Class["nginx::service"],
		 require => Class["nginx::install"],
  }



  file {"/etc/php-fpm.d/www.conf":
          owner  => 'root',
                 group  => 'root',
                 mode   =>  0644,
                 content=> template("/etc/puppet/modules/nginx/templates/www.conf.erb"),
                 notify => Class["nginx::service"],
                 require => Class["nginx::install"],
  }


        acl::group { "php_session_share_with_nginx" :
                id => "nginx",
                   mode => "rwx",
                   path => "/var/lib/php/session",
        }



}


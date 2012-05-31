
class webdav::params {

include apache


  file { "/etc/httpd/mods-enabled/dav.load":
		ensure => 'link',
		target => '/etc/httpd/mods-available/dav.load',
	  notify => Exec["apache-graceful"],
  }


     $webdav_config_dir = $operatingsystem ? {
                'CentOS'        => "/etc/httpd/conf.d",
                default         => "/etc/http/conf.d",
        }

        $webdav_share_file = "$webdav_config_dir/webdav.share.conf"



}


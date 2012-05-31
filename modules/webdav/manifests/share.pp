define webdav::share (
	$path=false,
	$alias=false,
	$allowuser=false,
	$allowed_hosts=false,
	$denied_hosts=false,
  	$allowuser=false,
	$allowgroup=false,
	$rouserlist=false,
	$rogrouplist=false,
	$rwuserlist=false,
  	$rwgrouplist=false
	) {

	include concat::setup
	include webdav

	concat::fragment { "webdav_share_$name":
		target	=> "${webdav::params::webdav_config_dir}/webdav.share.conf",
		content	=> template('webdav/webdav_share_conf.erb'),
		order	=> 01,
	}

}

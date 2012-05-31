define netatalk::share (
  	$comment=false,
	$path=false,
	$allow=false,
	$deny=false,
	$allowed_hosts=false,
	$denied_hosts=false,
	$cnidscheme=false,
	$public=false,
  	$dbpath=false,
	$maccharset=false,
	$rolist=false,
	$rwlist=false,
	$ea=false,
  	$dir_mask=false,
	$volcharset=false,
	$veto=false,
	$password=false,
	$options=false
	) {

	include concat::setup
	include netatalk

	concat::fragment { "netatalk_share_$name":
		target	=> "${netatalk::params::netatalk_config_dir}/AppleVolumes.default",
		content	=> template('netatalk/netatalk_share_conf.erb'),
		order	=> 01,
	}

}


class samba::params {

  $package = $operatingsystem ? {
    default => samba
  }
 
  $service = $operatingsystem ? {
    default => smb
  }

  $service_associated = $operatingsystem ? {
    default => nmb
  }

	$samba_config_dir = $operatingsystem ? {
		'CentOS'	=> "/etc/samba",
		default		=> "/etc/samba",
	}

	$samba_config = "$samba_config_dir/smb.conf"
	$samba_share_file = "$samba_config_dir/shares.conf"


}


class firewalldbbox {

	$ipv4_file = $operatingsystem ? {
		"debian"          => '/etc/iptables/rules.v4',
			/(RedHat|CentOS)/ => '/etc/sysconfig/iptables',
	}

	exec { "purge default firewall":
		command => "/sbin/iptables -F && /sbin/iptables-save > $ipv4_file && /sbin/service iptables restart",
			onlyif  => "/usr/bin/test `/bin/grep \"Firewall configuration written by\" $ipv4_file | /usr/bin/wc -l` -gt 0",
			user    => 'root',
	}

	/* Make the firewall persistent */
	exec { "persist-firewall":
		command     => "/bin/echo \"# This file is managed by puppet. Do not modify manually.\" > $ipv4_file && /sbin/iptables-save >> $ipv4_file", 
			    refreshonly => true,
			    user        => 'root',
	}

	/* purge anything not managed by puppet */
	resources { 'firewall':
		purge => true,
	}


	firewall { "000 accept all icmp requests":
		proto => "icmp",
		      action => "accept",
	} 

	firewall { "003 allow puppetmaster to run triggered run":
		proto => 'tcp',
		      port => '8139',
		      action => "accept",
	}

	firewall { "002 allow everyone to connect on ssh":
		proto => 'tcp',
		      port => '22',
		      action => "accept",
	}


	firewall { '002 INPUT allow loopback':
		iniface => 'lo',
			chain   => 'INPUT',
			action    => 'accept',
	}

	firewall { '004 INPUT allow related and established':
		state => ['RELATED', 'ESTABLISHED'],
		      action  => 'accept',
	}



	firewall { "999 drop all other requests":
		action => "drop",
	}




}

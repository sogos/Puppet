
class samba::config {

  include samba::params


	  firewall { "020 Allow clients to connect on SMB protocol":
		  port => '445',
		       iniface => 'eth1',
		       proto => 'tcp',
		       action => 'accept'
	  }

  firewall { "021 Allow clients to connect on SMB protocol":
	  port => '139',
	       iniface => 'eth1',
	       proto => 'udp',
	       action => 'accept'
  }



  firewall { "022 Allow clients to connect on SMB protocol":
	  port => '138',
	       iniface => 'eth1',
	       proto => 'udp',
	       action => 'accept'
  }

  firewall { "023 Allow clients to connect on SMB protocol":
	  port => '137',
	       iniface => 'eth1',
	       proto => 'udp',
	       action => 'accept'
  }


  firewall { "024 Allow clients to connect on SMB protocol":
	  port => '139',
	       iniface => 'eth1',
	       proto => 'tcp',
	       action => 'accept'
  }




}



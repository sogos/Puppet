
class netatalk::config {

  include netatalk::params



	  firewall { "010 Allow client to connect on AFP protocol":
		  port => '548',
		  proto => 'tcp',
		  action => 'accept'
	  }


}


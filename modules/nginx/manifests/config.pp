
class nginx::config {

  include nginx::params


	  firewall { "010 Allow clients to connect on DB-Manager interface":
		  port => '10000',
		       proto => 'tcp',
		       action => 'accept'
	  }


}


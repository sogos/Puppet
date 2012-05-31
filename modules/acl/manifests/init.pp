class acl {

	file { chuckacl:
		path => "/usr/local/bin/chuckacl",
		     content=> template("/etc/puppet/modules/acl/files/chuckacl"),
		     owner => root,
		     group => root,
		     mode => 750,
	}


    define group( $id, $mode, $path) {
            exec { "$id$mode$path" :
                    command   => "/usr/local/bin/chuckacl  -g $id -p $mode $path",
                    unless => "/usr/local/bin/chuckacl -c  -g $id -p $mode $path",
                    logoutput => true,
            }
    }
     

    define user( $id, $mode, $path) {
            exec { "$id$mode$path" :
                    command   => "/usr/local/bin/chuckacl -u $id -p $mode $path",
                    unless => "/usr/local/bin/chuckacl -c  -u $id -p $mode $path",           
                    logoutput => true,
            }
    }

}

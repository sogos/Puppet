node default {
	include ntp
}
node 'test2.db-box.fr' inherits default {
}
node 'superbox.db-box.fr' inherits default {
	include netatalk
		include avahi
		include firewalldbbox
		include acl
		include samba
		include apache
		include phpmyadmin
		include backuppc
		include webdav
		include concat::setup
		include nginx


}


	import "modules.pp"
	import "nodes.pp"
	import "common.pp"
	import "classes/*.pp"

Firewall {
    notify  => Exec["persist-firewall"],
    require => Exec["purge default firewall"],
}

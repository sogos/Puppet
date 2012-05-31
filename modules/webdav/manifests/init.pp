
class webdav {

	include webdav::params
	apache::module {"dav": }
	apache::module {"dav_fs": }
	apache::module {"auth_digest": }


}


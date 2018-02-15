######Install yum packages



class install_pkg{
	exec{'yum -y install vim':
		path		=>[ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', ],
	}


        exec{'yum -y install curl':
                path            =>[ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', ],
		require		=>Exec['yum -y install vim'],
        }


	exec{'yum -y install git':
                path            =>[ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', ],
		require		=>Exec['yum -y install curl'],
        }

}

class { 'install_pkg': }

###### PUPPET


class test_puppet{


#### INSTALL PACKAGES
        exec{'yum -y install vim':
                path            =>[ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', ],
		before		=>Exec['yum -y install curl'],
        }


        exec{'yum -y install curl':
                path            =>[ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', ],
                require         => Exec['yum -y install vim'],
        }


        exec{'yum -y install git':
                path            =>[ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', ],
                require         => Exec['yum -y install curl'],
        }


####### END INSTALL PACKAGES

######## CREATE USER

        user { 'monitor':
                ensure           => 'present',
                home             => '/home/monitor',
                shell            => '/bin/bash',
                password         => '$1$2fZbll.F$6H4UZA0O/fxU2K57EhfXf0',
                managehome       => true,
                system           => true,
		require		 => Exec['yum -y install git'], 
              }

##### END CREATE USER

##### CREATE DIRECTORY

	file{'/home/monitor/scripts/':
                ensure   => 'directory',
                path     => '/home/monitor/scripts',
		require  => User['monitor'], 
            }

        exec{'wget https://rawgit.com/patradovan20/Scripts/master/memory_check':
                cwd      =>'/home/monitor/scripts/',
                creates  =>'/home/monitor/scripts/memory_check',
                path     => ['/usr/bin', '/usr/sbin',],
		require  => File['/home/monitor/scripts'],
           }


}

######### END CREATE DIRECTORY


#####CRONTAB

cron{'mem_cron':

                command        =>'/home/monitor/src/memory_check',
                minute         =>'*/10',
		require	       =>Exec['wget https://rawgit.com/patradovan20/Scripts/master/memory_check'], 
        }

#### END CRONTAB


#######SET PH TIME


exec{'cp -p /usr/share/zoneinfo/Asia/Manila /etc/localtime':

	path            =>[ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/', ],	
	require	        =>Cron['mem_cron'],
}


class {'test_puppet': }

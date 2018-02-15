####Create Directory

class create_dir{

	file{'/home/monitor/scripts/':
		ensure   => 'directory',
		path     => '/home/monitor/scripts',
	    }

	exec{'wget https://rawgit.com/patradovan20/Scripts/master/memory_check':
		cwd      =>'/home/monitor/scripts/',
		creates  =>'/home/monitor/scripts/memory_check',
		path     => ['/usr/bin', '/usr/sbin',],
	    }

}
class { 'create_dir': }

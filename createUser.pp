#####create User

class create_user{
	user { 'monitor':
  		ensure           => 'present',
 		home             => '/home/monitor',
 		shell            => '/bin/bash',
		password	 => '$1$2fZbll.F$6H4UZA0O/fxU2K57EhfXf0',
		managehome	 => true,
		system		 => true,
	      }

}

class { 'create_user' : }

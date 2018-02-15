#####create User

class create_user{
	user { 'monitor':
  		ensure           => 'present',
 		home             => "/home/monitor",
  		password         => 'password1',
 		shell            => '/bin/bash',
	      }

}

class { 'create_user' : }

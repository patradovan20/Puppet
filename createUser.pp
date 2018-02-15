#####create User

class create_user{
	user { 'sample':
  		ensure           => 'present',
 		home             => "/home/sample",
  		password         => 'password1',
 		shell            => '/bin/bash',
	      }

}

class { 'create_user' : }

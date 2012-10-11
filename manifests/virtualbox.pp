  class { 'apt':
    always_apt_update => true,
  }
  apt::source { 'puppetlabs':
    location   => 'http://apt.puppetlabs.com',
    repos      => 'main',
    key        => '4BD6EC30',
    key_server => 'pgp.mit.edu',
  }

  case $::operatingsystem {
    default: { $default_packages = ['subversion','git','tree','zip','unzip','ant','ant-contrib','curl','wget'] }
  }

  package { $default_packages:
    ensure  => latest,
    require => Exec['apt_update'],
  }

  class {'apache': }
  apache::mod { 'headers': }
  apache::mod { 'expires': }
  apache::mod { 'rewrite': }
  apache::mod { 'php5': }

 $php5_packagelist = ['php5-cli', 'php5-dev', 'php-pear', 'php5-curl', 'php5-mysql', 'php5-sqlite', 'php5-xdebug',]
  package { $php5_packagelist:
    ensure  => latest,
    require => Exec['apt_update'],
  }

  class { 'mysql': }
  class { 'mysql::server':
    config_hash => { 'root_password' => 'vagrant' }
  }
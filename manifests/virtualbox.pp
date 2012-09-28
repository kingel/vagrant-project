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
    default: { $default_packages = ['subversion','git','tree','zip','unzip', 'ruby','rubygems','curl','wget'] }
  }

  package { $default_packages:
    ensure  => latest,
    require => Exec['apt_update'],
  }

  case $::operatingsystem {
    default: { $gem_packages = ['librarian-puppet','puppet-qatools'] }
  }

  package { $gem_packages:
    ensure   => latest,
    provider => gem,
  }
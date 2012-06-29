class apps::baseApps {

    case $::operatingsystem {
        default: { $base_packages = ["tree","zip","unzip","gzip","ant","ant-contrib","php5-cli","php-pear","python-setuptools","subversion","git-core","git-svn"] }
    }

    package { $base_packages:
        ensure  => latest,
        require => Exec["apt_update"],
    }
}
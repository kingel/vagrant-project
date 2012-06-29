class apps::devApps {

    case $::operatingsystem {
        default: { $dev_packages = ["cmake", "cmake-qt-gui","python","apt-utils","doxygen","rpm","dpkg-dev","ia32-libs","libgtest-dev","google-mock"] }
    }

    package { $dev_packages:
        ensure => installed,
        require => Exec["apt-get_update"],
    }
}
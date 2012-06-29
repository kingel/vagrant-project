class files::workspace {

    file { "/mnt/workspace":
        ensure  => directory,
        require => Group["puppet"],
    }

    file { "/home/vagrant/workspace":
      ensure  => link,
      target  => "/mnt/workspace",
      require => File["/mnt/workspace"],
    }
}
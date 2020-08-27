class docker::install {
    package {'curl':
      ensure  => present,
    }  
    exec {'apt-update':
      command => '/usr/bin/apt-get update'
    }
    exec {'download_docker_key':
      command => '/usr/bin/curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -'
    }
    exec {'add_docker_repo':
      command => '/usr/bin/add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"',require => Exec['apt-update']
    }
    exec {'docker_cache':
      command => '/usr/bin/apt-cache policy docker-ce'
    }

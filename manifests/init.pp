class nginx {
  # Windows package name: nginx-service
  package { 'nginx':
    ensure => present,
  }

  # Windows path: C:/ProgramData/nginx/html
  # Windows owner/group: Administrator / Administrators
  file { '/var/www':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0775',
  }
  # Windows path: C:/ProgramData/nginx/html/index.html
  # Windows owner/group: Administrator / Administrators
  file { '/var/www/index.html':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0664',
    source => 'puppet:///modules/nginx/index.html',
  }

  # Windows path: C:/ProgramData/nginx/conf/nginx.conf
  # Windows owner/group: Administrator / Administrators
  file { '/etc/nginx/nginx.conf':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0664',
    source => 'puppet:///modules/nginx/nginx.conf',
    notify => Service['nginx'],
  }

  # Windows path: C:/ProgramData/nginx/conf.d/default.conf
  # Windows owner/group: Administrator / Administrators
  file { '/etc/nginx/conf.d/default.conf':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0664',
    source => 'puppet:///modules/nginx/default.conf',
    notify => Service['nginx'],
  }

  service { 'nginx':
    ensure    => running,
    enable    => true,
  }
}

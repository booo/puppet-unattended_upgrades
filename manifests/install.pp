class unattended_upgrades::install {
  package { 'unattended-upgrades':
    ensure => 'present',
  }
  file { '/etc/apt/apt.conf.d/50unattended-upgrades':
    ensure  => present,
    content => template('unattended_upgrades/50unattended-upgrades.erb'),
    require => Package['unattended-upgrades'],
  }
  file { '/etc/apt/apt.conf.d/20auto-upgrades':
    ensure  => present,
    content => template('unattended_upgrades/20auto-upgrades.erb'),
    require => Package['unattended-upgrades'],
  }
}

class unattended_upgrades::install(
  $allowd_origins,
  $package_blacklist,
  $auto_fix_interrupted_dpkg,
  $minimal_steps,
  $install_on_shutdown,
  $mail,
  $mail_only_on_error,
  $remove_unused_dependencies,
  $automatic_reboot,
  $dl_limit,
){
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

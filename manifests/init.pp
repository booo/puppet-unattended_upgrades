class unattended_upgrades() {
  anchor { 'unattended_upgrades::begin':
    before => Class['unattended_upgrades::install'],
    notify => Class['unattended_upgrades::service'],
  }
  class { 'unattended_upgrades::install': }
  class { 'unattended_upgrades::service': }
  anchor { 'unattended_upgrades::end':
    require => Class['unattended_upgrades::service']
  }
}

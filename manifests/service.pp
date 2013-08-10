class unattended_upgrades::service {
  service { 'unattended-upgrades':
    ensure   => 'running',
    provider => 'init',
  }
}

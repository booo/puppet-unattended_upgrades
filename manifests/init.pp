class unattended_upgrades(
  $allowd_origins = ['security'],
  $package_blacklist = [],
  $auto_fix_interrupted_dpkg = true,
  $minimal_steps = false,
  $install_on_shutdown = false,
  $mail = '',
  $mail_only_on_error = false,
  $remove_unused_dependencies = false,
  $automatic_reboot = false,
  $dl_limit = 0,
) {
  anchor { 'unattended_upgrades::begin':
    before => Class['unattended_upgrades::install'],
    notify => Class['unattended_upgrades::service'],
  }
  class { 'unattended_upgrades::install':
    allowd_origins             => $allowd_origins,
    package_blacklist          => $package_blacklist,
    auto_fix_interrupted_dpkg  => $auto_fix_interrupted_dpkg,
    minimal_steps              => $minimal_steps,
    install_on_shutdown        => $install_on_shutdown,
    mail                       => $mail,
    mail_only_on_error         => $mail_only_on_error,
    remove_unused_dependencies => $remove_unused_dependencies,
    automatic_reboot           => $automatic_reboot,
    dl_limit                   => $dl_limit,
  }
  class { 'unattended_upgrades::service': }
  anchor { 'unattended_upgrades::end':
    require => Class['unattended_upgrades::service']
  }
}

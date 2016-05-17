# == Class: puppet_agent::config
#
# Drops in the templated puppet.conf to the appropriate path dependant on the
# type of Puppet installed.
#
# === Authors
#
# Brendan Murtagh <brendan.r.murtagh@gmail.com>
#
# === Copyright
#
# Copyright 2014 Brendan Murtagh, unless otherwise noted.
#
class puppet_agent::config (

  $puppet_config_path = $::puppet_agent::puppet_config_path,
  $config_template    = $::puppet_agent::config_template,
  $puppet_service     = $::puppet_agent::puppet_service,
  $puppet_vardir      = $::puppet_agent::puppet_vardir,
  $puppet_ssldir      = $::puppet_agent::puppet_ssldir,
  $puppet_logdir      = $::puppet_agent::puppet_logdir,
  $puppet_rundir      = $::puppet_agent::puppet_rundir,
  $puppet_user        = $::puppet_agent::puppet_user,
  $puppet_group       = $::puppet_agent::puppet_group,
  $puppetmaster       = $::puppet_agent::puppetmaster,
  $runinterval        = $::puppet_agent::runinterval,
  $report             = $::puppet_agent::report,

) inherits puppet_agent {

  file { "${puppet_config_path}/puppet.conf":
    ensure  => present,
    content => template($config_template),
    notify  => Service[$puppet_service],
  }

}

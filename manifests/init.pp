# == Class: puppet_agent
#
# Straightforward module to manage a node's puppet.conf
#
# === Authors
#
# Brendan Murtagh <brendan.r.murtagh@gmail.com>
#
# === Copyright
#
# Copyright 2014 Brendan Murtagh, unless otherwise noted.
#
class puppet_agent (

  # general params
  $install_type       = $::puppet_agent::params::install_type,
  $config_template    = $::puppet_agent::params::config_template,
  $service_ensure     = $::puppet_agent::params::service_ensure,
  $service_enable     = $::puppet_agent::params::service_enable,
  $runinterval        = $::puppet_agent::params::runinterval,
  $puppetmaster       = $::puppet_agent::params::puppetmaster,
  # enterprise params
  $enterprise_path    = $::puppet_agent::params::enterprise_path,
  $enterprise_bin     = $::puppet_agent::params::enterprise_bin,
  $enterprise_user    = $::puppet_agent::params::enterprise_user,
  $enterprise_group   = $::puppet_agent::params::enterprise_group,
  $enterprise_vardir  = $::puppet_agent::params::enterprise_vardir,
  $enterprise_ssldir  = $::puppet_agent::params::enterprise_ssldir,
  $enterprise_logdir  = $::puppet_agent::params::enterprise_logdir,
  $enterprise_rundir  = $::puppet_agent::params::enterprise_rundir,
  # open_source params
  $open_source_path   = $::puppet_agent::params::open_source_path,
  $open_source_bin    = $::puppet_agent::params::open_source_bin,
  $open_source_user   = $::puppet_agent::params::open_source_user,
  $open_source_group  = $::puppet_agent::params::open_source_group,
  $open_source_vardir = $::puppet_agent::params::open_source_vardir,
  $open_source_ssldir = $::puppet_agent::params::open_source_ssldir,
  $open_source_logdir = $::puppet_agent::params::open_source_logdir,
  $open_source_rundir = $::puppet_agent::params::open_source_rundir,

) inherits puppet_agent::params {

  if !($puppetmaster) {
    fail('The $puppetmaster must be configured for the module to function properly.')
  }

  # validated module parameters
  # general params
  validate_string($install_type)
  validate_string($config_template)
  validate_string($service_ensure)
  validate_bool($service_enable)
  validate_string($runinterval)
  validate_string($puppetmaster)
  # enterprise params
  validate_string($enterprise_path)
  validate_string($enterprise_bin)
  validate_string($enterprise_user)
  validate_string($enterprise_group)
  validate_string($enterprise_vardir)
  validate_string($enterprise_ssldir)
  validate_string($enterprise_logdir)
  validate_string($enterprise_rundir)
  # open_source params
  validate_string($open_source_path)
  validate_string($open_source_bin)
  validate_string($open_source_user)
  validate_string($open_source_group)
  validate_string($open_source_vardir)
  validate_string($open_source_ssldir)
  validate_string($open_source_logdir)
  validate_string($open_source_rundir)

  # set configuration parameters according to Puppet version defined
  case $install_type {
    'enterprise': {
      $puppet_config_path = $enterprise_path
      $puppet_service     = $enterprise_bin
      $puppet_user        = $enterprise_user
      $puppet_group       = $enterprise_group
      $puppet_vardir      = $enterprise_vardir
      $puppet_ssldir      = $enterprise_ssldir
      $puppet_logdir      = $enterprise_logdir
      $puppet_rundir      = $enterprise_rundir
    }
    'open_source': {
      $puppet_config_path = $open_source_path
      $puppet_service     = $open_source_bin
      $puppet_user        = $open_source_user
      $puppet_group       = $open_source_group
      $puppet_vardir      = $open_source_vardir
      $puppet_ssldir      = $open_source_ssldir
      $puppet_logdir      = $open_source_logdir
      $puppet_rundir      = $open_source_rundir
    }
    default: {
      fail("The ${module_name} is unable to determine the install_type.")
    }
  }

  # include supporting classes
  include puppet_agent::config
  include puppet_agent::service

  Class['puppet_agent'] -> Class['puppet_agent::config'] -> Class['puppet_agent::service']

}

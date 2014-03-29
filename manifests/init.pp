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
  $config_template    = $::puppet_agent::parmas::config_template,
  $service_ensure     = $::puppet_agent::parmas::service_ensure,
  $service_enable     = $::puppet_agent::params::service_enable,
  $runinterval        = $::puppet_agent::params::runinterval,
  $puppetmaster       = $::puppet_agent::params::puppetmaster,
  # enterprise params
  $enterprise_path    = $::puppet_agent::params::enterprise_path,
  $enterprise_bin     = $::puppet_agent::parmas::enterprise_bin,
  $enterprise_user    = $::puppet_agent::parmas::enterprise_user
  $enterprise_group   = $::puppet_agent::parmas::enterprise_group
  $enterprise_vardir  = $::puppet_agent::params::enterprise_vardir
  $enterprise_logdir  = $::puppet_agent::params::enterprise_logdir
  $enterprise_rundir  = $::puppet_agent::params::enterprise_rundir
  # open_source params
  $open_source_path   = $::puppet_agent::params::open_source_path,
  $open_source_bin    = $::puppet_agent::parmas::open_source_bin,
  $open_source_group  = $::puppet_agent::parmas::open_source_group
  $open_source_user   = $::puppet_agent::parmas::open_source_user
  $open_source_vardir = $::puppet_agent::parmas::open_source_vardir
  $open_source_logdir = $::puppet_agent::parmas::open_source_logdir
  $open_source_rundir = $::puppet_agent::parmas::open_source_rundir

) inherits phrg_puppet::params {

  # include supporting classes
  include puppet_agent::config
  include puppet_agent::service

  # validated module parameters
  validate_string($install_type)
  validate_string($runinterval)
  validate_string($puppetmaster)
  validate_string($enterprise_path)
  validate_string($open_source_path)
  validate_string($enterprise_bin)
  validate_string($open_source_bin)
  validate_string($config_template)
  validate_string($service_ensure)
  validate_bool($service_enable)
  validate_string($enterprise_user)
  validate_string($enterprise_group)
  validate_string($enterprise_vardir)
  validate_string($enterprise_logdir)
  validate_string($enterprise_rundir)
  validate_string($open_source_group)
  validate_string($open_source_user)
  validate_string($open_source_vardir)
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
      $puppet_logdir      = $enterprise_logdir
      $puppet_rundir      = $enterprise_rundir
    }
    'open_source': {
      $puppet_config_path = $open_source_path
      $puppet_service     = $open_source_bin
      $puppet_user        = $open_source_user
      $puppet_group       = $open_source_group
      $puppet_vardir      = $open_source_vardir
      $puppet_logdir      = $open_source_logdir
      $puppet_rundir      = $open_source_rundir
    }
    default: {
      fail("The ${module_name} is unable to determine the install_type.")
    }
  }

}

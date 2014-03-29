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

  $install_type     = $::puppet_agent::params::install_type,
  $enterprise_path  = $::puppet_agent::params::enterprise_path,
  $open_source_path = $::puppet_agent::params::open_source_path,
  $enterprise_bin   = $::puppet_agent::parmas::enterprise_bin,
  $open_source_bin  = $::puppet_agent::parmas::open_source_bin,
  $config_template  = $::puppet_agent::parmas::config_template,
  $service_ensure   = $::puppet_agent::parmas::service_ensure,
  $service_enable   = $::puppet_agent::params::service_enable,

) inherits phrg_puppet::params {

  # include supporting classes
  include puppet_agent::config
  include puppet_agent::service

  # validated module parameters
  validate_string($install_type)
  validate_string($enterprise_path)
  validate_string($open_source_path)
  validate_string($enterprise_bin)
  validate_string($open_source_bin)
  validate_string($config_template)
  validate_string($service_ensure)
  validate_bool($service_enable)

  # manage puppet.conf & service according to Puppet version defined
  case $install_type {
    'enterprise': {
      $puppet_config_path = $enterprise_path
      $puppet_service     = $enterprise_bin
    }
    'open_source': {
      $puppet_config_path = $open_source_path
      $puppet_service     = $open_source_bin
    }
    default: {
      fail("The ${module_name} is unable to determine the puppet_type.")
    }
  }

}

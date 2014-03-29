# == Class: puppet_agent::params
#
# Parameters for Puppet class
#
# === Variables
#
# [*install_type*]
#   The type of Puppet installation in use. Defaults to 'enterprise'
#   Available configuration options are 'enterprise' and 'open_source'
#
# [*enterprise_path*]
#   The path to puppet.conf for Puppet Enterprise editon
#
# [*open_source_path*]
#   The path to puppet.conf for Puppet Open Source editon
#
# [*enterprise_bin*]
#   Puppet enterprise binary filename
#
# [*open_source_bin*]
#   Puppet open source binary filename
#
# [*config_template*]
#   Locatation of the module's puppet.conf template
#
# [*service_ensure*]
#   Whether Puppet's service should be running
#
# [*service_enable*]
#   Whether Puppet's service should be enabled to start at boot
#
# === Authors
#
# Brendan Murtagh <brendan.r.murtagh@gmail.com>
#
# === Copyright
#
# Copyright 2014 Brendan Murtagh, unless otherwise noted.
#
class puppet_agent::params {

  $install_type     = 'enterprise'
  $enterprise_path  = '/etc/puppetlabs/puppet'
  $open_source_path = '/etc/puppet'
  $enterprise_bin   = 'pe-puppet-agent'
  $open_source_bin  = 'puppet'
  $config_template  = 'puppet_agent/puppet.conf.erb'
  $service_ensure   = 'running'
  $service_enable   = true

}

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
# [*runinterval*]
#   Configure Puppet's runinterval. Defaults to 28800 seconds (8 hrs)
#
# [*puppetmaster*]
#   Configure the Puppet Master's FQDN
#
# [*enterprise_user*]
#   Puppet group for Puppet Enterprise editon
#
# [*enterprise_group*]
#   Puppet group for Puppet Enterprise editon
#
# [*enterprise_vardir*]
#   Vardir path for Puppet Enterprise editon
#
# [*enterprise_logdir*]
#   Logdir path for Puppet Enterprise editon
#
# [*entperise_rundir*]
#   Rundir path for Puppet Enterprise editon
#
# [*open_source_user*]
#   Puppet user for Puppet Open Source editon
#
# [*open_source_group*]
#   Puppet group for Puppet Open Source editon
#
# [*open_source_vardir*]
#   Vardir path for Puppet Open Source editon
#
# [*open_source_logdir*]
#   Logdir path for Puppet Open Source editon
#
# [*open_source_rundir*]
#   Rundir path for Puppet Open Source editon
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

  # general params
  $install_type       = 'enterprise'
  $config_template    = 'puppet_agent/puppet.conf.erb'
  $service_ensure     = 'running'
  $service_enable     = true
  $runinterval        = '28800' # 8hrs
  $puppetmaster       = 'UNSET'
  # enterprise params
  $enterprise_path    = '/etc/puppetlabs/puppet'
  $enterprise_bin     = 'pe-puppet-agent'
  $enterprise_user    = 'pe-puppet'
  $enterprise_group   = 'pe-puppet'
  $enterprise_vardir  = '/var/opt/lib/pe-puppet'
  $enterprise_logdir  = '/var/log/pe-puppet'
  $enterprise_rundir  = '/var/run/pe-puppet'
  # open_source params
  $open_source_path   = '/etc/puppet'
  $open_source_bin    = 'puppet'
  $open_source_user   = 'puppet'
  $open_source_group  = 'puppet'
  $open_source_vardir = '/var/opt/lib/puppet'
  $open_source_logdir = '/var/log/puppet'
  $open_source_rundir = '/var/run/puppet'

}

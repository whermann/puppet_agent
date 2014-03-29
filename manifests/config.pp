# == Class: puppet_agent::config
#
# Drops in the templated puppet.conf to the appropriate path
# dependant on the type of Puppet installed.
#
# === Variables
#
# [*puppet_config_path*]
#   The path to Puppet's puppet.conf file dependant on the type
#   of Puppet installation defined
#
# [*config_template*]
#   Locatation of the module's puppet.conf template
#
# [*puppet_service*]
#   Puppet's binary name dependant on the type of Puppet installation defined
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

  $puppet_config_path = $::puppet_agent::puppet_config_path
  $config_template    = $::puppet_agent::config_template
  $puppet_service     = $::puppet_agent::puppet_service

) {

  file { "${puppet_config_path}/puppet.conf":
    ensure  => present,
    content => template($config_template),
    notify  => Service[$puppet_service],
  }

}

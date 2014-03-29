# == Class: puppet_agent::service
#
# Manages the Puppet service
#
# === Variables
#
# [*puppet_service*]
#   Puppet's binary name dependant on the type of Puppet installation
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
class puppet_agent::service (

  $puppet_service = $::puppet_agent::puppet_service
  $service_ensure = $::puppet_agent::service_ensure
  $service_enable = $::puppet_agent::service_enable

) {

  service { $puppet_service:
    ensure     => $service_ensure,
    name       => $puppet_service,
    enable     => $service_enable,
    hasrestart => true,
    hasstatus  => true,
  }

}

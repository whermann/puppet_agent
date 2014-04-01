puppet_agent
-------

* Puppet module to manage the puppet.conf via Puppet for a node.
* Supports Puppet Enterprise and Puppet Open Source editions

Author
-------

* Brendan Murtagh - [@bmurt](https://github.com/bmurt/)

Examples
-------

  class { '::puppet_agent':
    puppetmaster => 'puppet.contoso.com',
    install_type => 'open_source',
  }

At a minimum, the puppetmaster parameter must be configured. The install_type
defaults to 'enterprise' and can also have the 'open_source' value. All other
values will default to Puppet Enterprise or Open Source defaults.

The environment value is configured based on the environment used upon the last
agent checkin. To change the environment, checkin using a different environment.
For example after testing a feature release, checkin with production:

  puppet agent --test --environment production

This minimal class can be added to any role/profile or node definition.

Contributions
-------

* Contributions are encouraged. Please fork and submit a PR for review.

Support
-------

Please log issues at https://github.com/bmurt/puppet_agent/issues

License
-------

Apache GPL v2

Notes
-------
* Not compatible with base Vagrant provisioning due to `puppet apply` being used as the method
  - If another module installs Puppet or PE, this module _should_ be compatible. Untested & feedback welcomed.

Changelog
-------

* v0.0.3
  - Update params to match out-of-the-box values
  - Add examples
  - Add verification for $puppetmaster value to ensure parameter is configured

* v0.0.2
  - Bug Fixes
  - Set class execution order

* v0.0.1
  - Initial Release

puppet_agent
-------

* Puppet module to manage the puppet.conf via Puppet for a node.
* Supports Puppet Enterprise and Puppet Open Source editions

Author
-------

* Brendan Murtagh - [@bmurt](https://github.com/bmurt/)

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

* v0.0.1
  - Initial Release

* v0.0.2
  - Bug Fixes
  - Set class execution order
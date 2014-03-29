# puppetmaster_fqdn

Facter.add("puppetmasterfqdn") do
  setcode do
    Facter::Util::Resolution.exec('/usr/local/bin/puppet agent --configprint server')
  end
end

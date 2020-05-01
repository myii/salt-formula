# frozen_string_literal: true

version =
  case platform[:family]
  when 'redhat'
    case platform[:name]
    when 'amazon'
      '3000.2-1.amzn2'
    when 'centos'
      '3000.2-1.el8'
    end
  when 'fedora'
    # Issue in the upstream repo, should be `3000.2`
    '3000.1-1.fc31'
  when 'suse'
    # Issue in the upstream repo, should be `3000.2`
    '2019.2.0-lp151.28.1'
  when 'debian'
    '3000.2+ds-1'
  end

control 'salt packages' do
  title 'should be installed'

  %w[
    salt-master
    salt-minion
  ].each do |p|
    describe package(p) do
      it { should be_installed }
      its('version') { should eq version }
    end
  end
end

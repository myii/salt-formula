# frozen_string_literal: true

version =
  case platform[:family]
  when 'redhat'
    case platform[:name]
    when 'amazon'
      '2019.2.4-1.amzn2'
    when 'centos'
      '2019.2.4-1.el8'
    end
  when 'suse'
    # Issue in the upstream repo, should be `2019.2.4`
    '2019.2.0-lp151.28.1'
  when 'debian'
    '2019.2.4+ds-1'
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

# frozen_string_literal: true

version =
  case platform[:family]
  when 'redhat'
    case platform[:name]
    when 'amazon'
      '3000-1.amzn2'
    when 'centos'
      '3000-1.el8'
    end
  when 'fedora'
    '3000-5.fc31'
  when 'suse'
    '3000-lp150.21.1'
  when 'debian'
    '3000+ds-1'
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

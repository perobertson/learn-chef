#
# Cookbook Name:: webserver
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'webserver::default' do
  context 'on CentOS' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'centos', version: '6.6')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs httpd' do
      expect(chef_run).to install_package 'httpd'
    end

    it 'enables the httpd service' do
      expect(chef_run).to enable_service 'httpd'
    end

    it 'starts the httpd service' do
      expect(chef_run).to start_service 'httpd'
    end
  end

  context 'on Ubuntu' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04')
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'installs apache2' do
      expect(chef_run).to install_package 'apache2'
    end

    it 'enables the apache2 service' do
      expect(chef_run).to enable_service 'apache2'
    end

    it 'starts the apache2 service' do
      expect(chef_run).to start_service 'apache2'
    end
  end
end

require 'spec_helper'

describe 'unattended_upgrades' do
    it { should include_class('unattended_upgrades::install') }
    it { should include_class('unattended_upgrades::service') }
end

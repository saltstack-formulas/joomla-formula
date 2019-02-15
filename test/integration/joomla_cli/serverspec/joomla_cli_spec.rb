require "serverspec"

# Set backend type
set :backend, :exec

describe 'joomla cli tool' do

    joomla_cli_link = '/usr/local/bin/joomla'
    joomla_cli = '/usr/local/bin/vendor/joomlatools/console/bin/joomla'

    describe file(joomla_cli_link) do
        it { should be_symlink }
    end
    
    describe file(joomla_cli) do
        it { should exist }
        it { should be_mode 755 }
        it { should be_owned_by 'www-data' }
        it { should be_grouped_into 'www-data' }
    end
end

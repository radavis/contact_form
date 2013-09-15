require 'spec_helper'

describe Feedback do
  it { should have_valid(:first_name).when('Jimmy', 'Johnny', 'James') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('Neutron', 'Mnemonic', 'Taylor') }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_valid(:subject).when('Great Service!') }
  it { should_not have_valid(:subject).when(nil, '') }

  it { should have_valid(:description).when("I'm telling all my friends") }
  it { should_not have_valid(:description).when(nil, '') }

  it { should have_valid(:email).when('someone@gmail.com') }
  it { should_not have_valid(:email).when(nil, '') }
end

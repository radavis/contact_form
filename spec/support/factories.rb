FactoryGirl.define do
  factory :feedback do
    email 'johnny@mnemonic.com'
    subject 'Memory Upgrade'
    description '160GB is not sufficient'
    first_name 'Johnny'
    last_name 'Mnemonic'
  end
end

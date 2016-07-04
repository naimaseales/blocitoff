FactoryGirl.define do
  factory :user do
    transient do
      skip_confirmation true
    end

    email 'admin2@example.com'
    password 'password'

    before(:create) do |user, evaluator|
      user.skip_confirmation! if evaluator.skip_confirmation
    end
  end
end

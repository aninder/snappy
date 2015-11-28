FactoryGirl.define do
  factory :user do
    name {FFaker::Name.first_name + Random.rand(0..1000000000).to_s }
    password {FFaker::Internet.password(3,10)}

    factory :fixed_user do
      name "camus"
      password "1234"
    end

    factory :admin do
      admin true
    end
  end
end
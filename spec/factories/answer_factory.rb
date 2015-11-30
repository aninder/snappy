FactoryGirl.define do
  factory :answer do
    ans FFaker::Lorem.phrase

    factory :valid_answer do
      association :user
      association :question, factory: :valid_question
    end
  end
end
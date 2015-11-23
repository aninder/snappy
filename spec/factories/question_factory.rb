FactoryGirl.define do
  factory :question do
    ques "what is the meaning of life?"

    factory :valid_question do
      association :user
    end
  end
end
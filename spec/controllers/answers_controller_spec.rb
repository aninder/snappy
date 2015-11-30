require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  describe "POST #create" do
    context "with user not signed in" do
      it "returns error when users not logged in" do
        answer = FactoryGirl.build(:valid_answer)
        post :create, user_id:answer.user, question_id:answer.question.id, answer:answer
        expect(response).to have_http_status(420)
        #random url parameters
        10.times {
          post :create,
               user_id:FactoryGirl.fuzz_without_boolean_and_nil_values,
               question_id:FactoryGirl.fuzz_without_boolean_and_nil_values,
               answer:FactoryGirl.fuzz_without_boolean_and_nil_values

          expect(response).to have_http_status(420)
        }
      end
    end

    # context "with user signed in" do
    #   before :each do
    #     @u = FactoryGirl.create(:user)
    #     login(@u)
    #   end
    #   it "does not allow insecure direct object reference" do
    #     post :create, question:FactoryGirl.attributes_for(:question), user_id:3
    #     expect(response.headers).to include('X-Hacking-Allowed')
    #   end
    #   it "saves with valid attributes" do
    #     expect {
    #       post :create, question:FactoryGirl.attributes_for(:question), user_id:@u.id
    #     }.to change(Question, :count).by 1
    #   end
    # end
  end
end

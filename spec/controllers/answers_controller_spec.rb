require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  describe "POST #create" do
    context "with user not signed in" do
      it "returns error when users not logged in" do
        answer = FactoryGirl.build(:valid_answer)
        post :create,
             user_id:answer.user,
             question_id:answer.question.id,
             answer:{ans:answer}
        expect(response).to have_http_status(420)
        #random url parameters
        10.times {
          post :create,
               user_id:FactoryGirl.fuzz_without_boolean_and_nil_values,
               question_id:FactoryGirl.fuzz_without_boolean_and_nil_values,
               answer:{ans:FactoryGirl.fuzz_without_boolean_and_nil_values}
          expect(response).to have_http_status(420)
        }
      end
    end

    context "with user signed in" do
      before :each do
        @u = FactoryGirl.create(:user)
        login(@u)
        @q = FactoryGirl.create(:question, user_id:@u.id)
        # post :create, question:FactoryGirl.attributes_for(:question), user_id:@u.id
      end
      it "saves the answer with correct attributes" do
        expect {
        post :create,
             question_id:@q.id,
             user_id:@q.user.id,
             answer:{ans:FactoryGirl.fuzz_without_boolean_and_nil_values}
        }.to change(Answer,:count).by 1
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(user_question_path(id:@q.id))
        expect(flash[:notice]).to eq("your answer is saved")
      end
      it "gives error when answer is blank" do
        post :create,
             question_id:@q.id,
             user_id:@q.user.id,
             answer:{ans:nil}
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(user_question_path(id:@q.id))
        expect(flash[:notice]).to eq("fix your personnel problems first!")
      end
      it "gives error when question does not belong to the user" do
        post :create,
             question_id:@q.id,
             user_id:@q.user.id+1,
             answer:{ans:FactoryGirl.fuzz_without_boolean_and_nil_values}
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq("ur nuts")
      end
      it "gives error when question does not exist" do
        post :create,
             question_id:@q.id+2,
             user_id:@q.user.id,
             answer:{ans:FactoryGirl.fuzz_without_boolean_and_nil_values}
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq("sorry i forgot what the original question was!")
      end
    end
  end
end
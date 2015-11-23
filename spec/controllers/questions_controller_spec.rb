require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "populates array of questions" do
      num_of_times = Random.rand(0..100)
      num_of_times.times { |t| FactoryGirl.create(:valid_question) }
      get :index
      expect(assigns(:questions).count).to eq num_of_times
    end
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "POST #create" do
    context "with user not signed in #function_level_access_control" do
      it "returns error when users not logged in" do
        post :create, question: FactoryGirl.build(:valid_question), user_id:2
        expect(response).to have_http_status(420)
      end
    end
    context "with user signed in" do
      it "throws another hint when user_id in url is different from logged in user" do
        u = FactoryGirl.create(:user)
        login(u)
        post :create, question:FactoryGirl.attributes_for(:question), user_id:3
        expect(response.headers).to include('X-Hacking-Allowed')
      end
    end
    it "saves with valid attributes" do
      expect {
        u = FactoryGirl.create(:user)
        login(u)
        post :create, question:FactoryGirl.attributes_for(:question), user_id:u.id
      }.to change(Question, :count).by 1
    end
  end

  private

  def login(user)
    session[:user] = user.id
  end
end

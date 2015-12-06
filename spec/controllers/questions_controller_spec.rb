require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  describe "GET #all" do
    it "returns http success" do
      get :all
      expect(response).to have_http_status(:success)
    end
    it "populates array of questions" do
      num_of_times = Random.rand(0..100)
      num_of_times.times { |t| FactoryGirl.create(:valid_question) }
      get :all
      expect(assigns(:questions).count).to eq num_of_times
    end
    it "renders the :index template" do
      get :all
      expect(response).to render_template :all
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
      before :each do
        @u = FactoryGirl.create(:user)
        login(@u)
      end
      it "does not allow insecure direct object reference" do
        post :create, question:FactoryGirl.attributes_for(:question), user_id:3
        expect(response.headers).to include('X-Hacking-Allowed')
      end
      it "saves with valid attributes" do
        expect {
          post :create, question:FactoryGirl.attributes_for(:question), user_id:@u.id
        }.to change(Question, :count).by 1
      end
    end
  end

  describe "GET #index" do
    context "with user signed in" do
      before :each do
        @u = FactoryGirl.create(:user)
        login @u
        get :index, {user_id: @u.id}
      end
      it "returns http success" do
        expect(response).to have_http_status 200
      end
      it "renders the show template" do
        expect(response).to render_template :index
      end
      it "displays only logged in users questions" do
        5.times { FactoryGirl.create(:random_question, user:@u) }

        someotheruser = FactoryGirl.create(:user)
        3.times { FactoryGirl.create(:random_question, user:someotheruser) }

        yetsomeotheruser = FactoryGirl.create(:user)
        13.times { FactoryGirl.create(:random_question, user:yetsomeotheruser) }

        get :index, {user_id: @u.id}
        expect(assigns(:questions).count).to eq 5

        login someotheruser
        get :index, {user_id: someotheruser.id}
        expect(assigns(:questions).count).to eq 3

        login yetsomeotheruser
        get :index, {user_id: yetsomeotheruser.id}
        expect(assigns(:questions).count).to eq 13
      end
      it "displays only logged in user questions even though user name in url is random" do
        u2 = FactoryGirl.create(:user)
        13.times { FactoryGirl.create(:random_question, user:u2 ) }
        2.times { FactoryGirl.create(:random_question, user:@u ) }

        get :index, {user_id: u2}
        expect(assigns(:questions).count).to eq 2

        login u2
        get :index, user_id:@u
        expect(assigns(:questions).count).to eq 13
      end
    end

    context "with user not signed in" do
      it "returns error when user not logged in" do
        user = FactoryGirl.create(:user)
        get :index, {user_id: user.id}
        expect(response).to have_http_status 420
      end
    end
  end

  describe "GET #show " do
    before(:each) do
      @u = FactoryGirl.create(:user)
      @question = FactoryGirl.create(:random_question, user:@u)
    end

    it "shows the question page" do
      get :show, user_id:@u.id, id:@question.id
      expect(response).to have_http_status 200
      expect(response).to render_template :show
      expect(assigns(:question).id).to eq @question.id
    end
    it "shows the question page with given question id even though user_id is random" do
      get :show, user_id:Random.rand(100..1000), id:@question.id
      expect(response).to have_http_status 200
      expect(response).to render_template :show
      expect(assigns(:question).id).to eq @question.id
    end
  end

  describe "GET #edit " do
    before(:each) do
      @u = FactoryGirl.create(:user)
      @question = FactoryGirl.create(:random_question, user:@u)
    end

    context "with user signed in" do
      before :each do
        login(@u)
      end
      it "shows error if question does not belong to the user" do
        another_question = FactoryGirl.create(:random_question, user:FactoryGirl.create(:user))
        get :edit, user_id:@u.id, id:another_question.id
        expect(response).to have_http_status 302
        expect(flash[:notice]).to eq "you can only edit your own questions"
      end
      it "shows error when question is invalid" do
        get :edit, user_id:@question.user.id, id:@question.id+100
        expect(response).to have_http_status 302
        expect(flash[:notice]).to eq "question does not exist"
      end
    end

    context "with user not signed in" do
      it "shows error" do
        get :edit, user_id:@u.id, id:@question.id
        expect(response).to have_http_status 420
      end
      it "shows error 'with random url parameters'" do
        10.times {
          get :edit,
              user_id:FactoryGirl.fuzz_without_boolean_and_nil_values,
              id:FactoryGirl.fuzz_without_boolean_and_nil_values
          expect(response).to have_http_status 420
        }
      end
    end
  end

  describe "POST #create" do
    before(:each) do
      @u = FactoryGirl.create(:user)
      @question = FactoryGirl.create(:random_question, user:@u)
    end

    context "with user not signed in" do
      it "shows error" do
        post :update,
             user_id:FactoryGirl.fuzz_without_boolean_and_nil_values,
             id:FactoryGirl.fuzz_without_boolean_and_nil_values
        expect(response).to have_http_status 420
      end
    end
    context "with user signed in"  do
      before :each do
        login @u
      end
      it "does not allow to change question which does not belong to logged in user" do
        another_question = FactoryGirl.create(:random_question, user:FactoryGirl.create(:user))
        post :update,
             user_id:another_question.user.id,
             id:another_question.id


      end
    end
  end
end

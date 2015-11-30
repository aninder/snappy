require 'rails_helper'

RSpec.describe Answer, type: :model do
  context "with valid attributes" do
    it "increments count of num of users" do
      u = FactoryGirl.create(:user)
      q = FactoryGirl.create(:question, user:u)
      expect {
        FactoryGirl.create(:answer, user:u, question:q)
      }.to change(Answer, :count).by 1
    end
    it "also increments count for factory" do
      expect  {
        FactoryGirl.create(:valid_answer)
      }.to change(Answer, :count).by 1
    end
  end
  context "with invalid attributes" do
    it "is invalid without ans" do
      ans = FactoryGirl.build(:valid_answer, ans:nil)
      expect(ans.valid?).to be false
      expect(ans.errors.size).to eq 1
      expect(ans.errors[:ans]).not_to be nil
    end
    it "is invalid without user" do
      ans = FactoryGirl.build(:valid_answer, user:nil)
      expect(ans.valid?).to be false
      expect(ans.errors.size).to eq 1
      expect(ans.errors[:user]).not_to be nil
    end
    it "is invalid without question" do
      ans = FactoryGirl.build(:valid_answer, question:nil)
      expect(ans.valid?).to be false
      expect(ans.errors.size).to eq 1
      expect(ans.errors[:question]).not_to be nil
    end
  end
end

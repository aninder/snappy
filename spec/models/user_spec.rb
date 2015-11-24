require 'rails_helper'

RSpec.describe User, type: :model do

  context "with valid attributes" do
    it "increments count of num of users" do
      expect {
        FactoryGirl.create(:user)
      }.to change(User,:count).by 1
    end
  end

  context "with invalid attributes" do
    it "is invalid without name" do
      u = FactoryGirl.build(:user, name:"")
      expect(u.valid?).to be false
      expect(u.errors[:name]).not_to be nil
    end

    it "is not valid when name not a character or a number" do
      ["<",">","\n<script","@","-",""]
      ["<abc","asd@","asa\ns+d"].each {|name|
        u = FactoryGirl.build(:user, name:name);
        expect(u.valid?).to be false
        expect(u.errors[:name]).not_to be nil
        expect(u.errors[:name]).to be_an Array
        expect(u.errors[:name]).to include("is invalid")
        # expect(u.errors[:name].grep(/invalid/).length).to eq 1
      }
    end
  end
end

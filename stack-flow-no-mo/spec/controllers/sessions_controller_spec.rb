require 'rails_helper'

RSpec.describe UsersController do
  describe "#new" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end
  end
  describe "#create" do
    let(:user){ FactoryGirl.create :user}
      describe "create account" do
        it "creates the account if valid params" do
          expect {
           post :create, user: {
                username: user.username,
                password: user.password,
                password_confirmation: user.password
                                }
                }.to change { User.count }.by(1)
          end

        it "doesnt create the account with unvalid params" do
          expect {
            post :create, user: {
                username: nil,
                password: nil,
                password_confirmation: nil
                                 }
                }.to change { User.count }.by(0)
          end
      end #closes the #create


  describe "#show" do
    let(:user){ FactoryGirl.create :user}
    it "shows new user's profile page with a 200" do
      subject {get :show, user_id: user.id}
      expect(response.status).to eq(200)
    end
  end #closes the #show


  end
end

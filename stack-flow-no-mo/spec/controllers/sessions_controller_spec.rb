require 'rails_helper'

RSpec.describe UsersController do
  describe "new" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end
  end
  describe "#create" do
    let(:user){ FactoryGirl.create :user}
    # it "redirects to root path if correct credentials" do
    #   user = FactoryGirl.create(:user)
    #   click_link("Regis")
    #   post :create, :username => user.username, :password => user.password, :password_confirmation => user.password
    #   expect(response).to redirect_to root_path
    # end
    # it "redirects to sign in path with bad email" do
    #   user = FactoryGirl.create(:user)
    #   post :create, :username => nil, :password => user.password, :password_confirmation => user.password
    #   expect(response).to redirect_to new_users_path
    # end
    # it "redirects to sign in path with bad password" do
    #   user = FactoryGirl.create(:user)
    #   post :create, :username => user.username, :password => "wrong password", :password_confirmation => "wrong"
    #   expect(response).to redirect_to new_users_path
    # end
  describe "#create" do
    it "creates the account if valid params" do
      expect {
        post :create, user: {
          username: user.username,
          password: user.password,
          password_confirmation: user.password
        }
      }.to change { User.count }.by(1)
    end
  end
  end
end

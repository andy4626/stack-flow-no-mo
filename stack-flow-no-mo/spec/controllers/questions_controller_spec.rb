require 'rails_helper'

RSpec.describe QuestionsController do
  describe "#new" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end
  end

  describe "#create" do
    let(:user){FactoryGirl.create(:user)}
    stub_current_user :user
    let(:question){FactoryGirl.create :question}
    it "creates the question if valid params" do
      expect {
        post :create, question: {
          title: question.title,
          content: question.content,
          user_id: :user.id
        }
      }.to change {Question.count}.by(1)
    end

    it "creates the question if valid params" do
      expect {
        post :create, question: {
          title: nil,
          content: nil
        }
      }.to change {Question.count}.by(0)
    end
  end
end

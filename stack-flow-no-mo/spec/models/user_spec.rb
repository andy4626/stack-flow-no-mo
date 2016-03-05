require 'rails_helper'

RSpec.describe User do
  context "validations" do
    it { should validate_presence_of :username }
    it { should allow_value('zander').for(:username)}
    it { should validate_uniqueness_of :username}
  end

    it 'responds to username' do
      u = User.new
      expect(u).to respond_to(:username)
    end

    it 'responds to password' do
      u = User.new
      expect(u).to respond_to(:password)
    end

    it 'should have valid factory' do
      expect(FactoryGirl.build(:user)).to be_valid
    end

    it 'should require username' do
      expect(FactoryGirl.build(:user, :username => '')).not_to be_valid
    end
end

require 'rails_helper'
# RSpec.describe User do


describe User do
    # it { should allow_value("zander").for(:username)}
    # it { should validate_presence_of :username }
    it 'responds o username' do
      u = User.new
      expect(u).to respond_to(:username)
    end
end

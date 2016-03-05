require 'rails_helper'
# RSpec.describe User do


describe User do
  it { should allow_value("zander").for(:username)}
  it { should validate_presence_of :username }
end

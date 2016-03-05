require 'rails_helper'

RSpec.describe Answer do
  context "validations" do
    it { should validate_presence_of :content}
    it { should allow_value("hey").for(:content)}
  end
end

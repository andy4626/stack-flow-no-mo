require 'rails_helper'

RSpec.describe Question do
  context "validations" do
    it { should validate_presence_of :title}
    it { should validate_presence_of :content}
    it { should allow_value("hey").for(:title)}
    it { should allow_value("hey").for(:content)}
  end
end

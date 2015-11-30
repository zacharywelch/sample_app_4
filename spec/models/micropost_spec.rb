require 'spec_helper'

describe Micropost do

  let(:user) { FactoryGirl.create(:user) }
  subject(:micropost) { user.microposts.build(content: "Lorem ipsum") }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { micropost.user_id = nil }
    it { should_not be_valid }
  end  

  describe "when content is not present" do
    before { micropost.content = nil }
    it { should_not be_valid }
  end  

  describe "with content that is too long" do
    before { micropost.content = "a" * 141 }
    it { should_not be_valid }
  end  
end
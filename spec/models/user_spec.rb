require 'rails_helper'

describe User do
  it "takes default values" do
    create(:user).name.should eq 'noname'
  end

  it "has a valid factory" do
    create(:user).should be_valid
  end

  it "is invalid without email" do
    build(:user, email: nil).should_not be_valid
  end

  it "is invalid without password" do
    build(:user, password: nil).should_not be_valid
  end

  it "is invalid with short password" do
    build(:user, password: "1234567").should_not be_valid
  end
end
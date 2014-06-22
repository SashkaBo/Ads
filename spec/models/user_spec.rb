require 'rails_helper'
#require 'spec_helper'

describe User do
  it "takes default values" do
    u = User.create!(email: "as@as.by", password: "12345678")

    expect(u.name).to eq('noname')
  end

  it "has a valid factory" do
    Factory.create(:user).should be_valid
  end

  it "is invalid without email" do
    Factory.build(:user, email: nil).should_not be_valid
  end

  it "is invalid without password" do
    Factory.build(:user, password: nil).should_not be_valid
  end

  it "is invalid with short password" do
    Factory.build(:user, password: "1234567").should_not be_valid
  end
end
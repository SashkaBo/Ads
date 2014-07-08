require 'rails_helper'

describe Post do
  it "with status \"draft\" gets correct possible statuses for simple user" do
    create(:post).get_possible_statuses(create(:user)).should eq [:new]
  end

  it "with status \"reject\" gets correct possible statuses for simple user" do
    create(:post, status: "reject").get_possible_statuses(create(:user)).should eq [:draft]
  end

  it "with status \"new\" gets correct possible statuses for admin" do
    create(:post, status: "new").get_possible_statuses(create(:user, role: :admin)).should eq [:approve, :reject]
  end

  it "with status \"approve\" gets correct possible statuses for simple user" do
    create(:post, status: "approve").get_possible_statuses(create(:user)).should eq []
  end
end
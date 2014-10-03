require 'rails_helper'

RSpec.describe User, :type => :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "A User should have a valid user name" do
    @user = User.new
    expect(@user.name).not_to eq(true)
  end

  it "Length of username should not exceed 50 characters" do
    @user = User.new
    expect(@user.name.length).not_to < 50
  end

  it "A User should have a valid email" do
    @user = User.new
    expect(@user.email).not_to eq(true)
  end

  #expect("a string").not_to match(/a regex/)
  it "User's email id format not valid" do
    @user = User.new
    expect(@user.email).not_to match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end

  it "A User should have a valid phone number" do
    @user = User.new
    expect(@user.phone).not_to eq(true)
  end

  #expect("a string").not_to match(/a regex/)
  it "User's phone number format not valid" do
    @user = User.new
    expect(@user.phone).not_to match(/\A\d{3}\d{3}\d{4}\z/)
  end


end

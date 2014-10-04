require 'rails_helper'

RSpec.describe Resume, :type => :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "should have a valid title" do
    @resume = Resume.new
    expect(@resume.title).not_to eq(true)
  end

  it "Length of Resume title larger than 128 characters" do
    @resume = Resume.new
    expect(@resume.title.length).not_to < 128
  end

  it "should have a valid body" do
    @resume = Resume.new
    expect(@resume.body).not_to eq(true)
  end

  it "Length of Resume larger than 10k characters" do
    @resume = Resume.new
    expect(@resume.body.length).not_to < 10000
  end

  it "should have a valid owner id" do
    @resume = Resume.new
    expect(@resume.owner_id).not_to eq(true)
  end

end

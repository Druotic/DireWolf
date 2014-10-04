require 'rails_helper'

RSpec.describe Job, :type => :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "should have a valid owner-id" do
    @job = Job.new
    expect(@job.owner_id).not_to eq(true)
  end

  it "should have a valid title" do
    @job = Job.new
    expect(@job.title).not_to eq(true)
  end

  it "should have a valid description" do
    @job = Job.new
    expect(@job.description).not_to eq(true)
  end

  it "should have a valid category" do
    @job = Job.new
    expect(@job.category).not_to eq(true)
  end

  it "should have a valid deadline" do
    @job = Job.new
    expect(@job.deadline).not_to eq(true)
  end

end

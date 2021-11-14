require 'rails_helper'

RSpec.describe Paper, type: :model do
  it "should not validate without title" do
    @paper = Paper.new(venue: "Mind 49: 433-460", year: 1950)
    expect(@paper).to_not be_valid
  end

  it "should not validate without venue" do
    @paper = Paper.new(title: "COMPUTING MACHINERY AND INTELLIGENCE", year: 1950)
    expect(@paper).to_not be_valid
  end

  it "should not validate without numeric year" do
    @paper = Paper.new(title: "COMPUTING MACHINERY AND INTELLIGENCE", venue: "Mind 49: 433-460")
    expect(@paper).to_not be_valid
    @paper = Paper.new(title: "COMPUTING MACHINERY AND INTELLIGENCE", venue: "Mind 49: 433-460", year: "not a number")
    expect(@paper).to_not be_valid
  end

  it "should have and belong to many authors" do
    @paper = Paper.new(title: "COMPUTING MACHINERY AND INTELLIGENCE", venue: "Mind 49: 433-460", year: 1950)
    expect(@paper.authors).to be_empty
  end
end

require 'rails_helper'

describe "Author", type: :model do
    it "should have first name, last name, and homepage" do
        @author = Author.new(first_name: "Alan", last_name: "Turing", homepage: "http://wikipedia.org/Alan_Turing")
        expect(@author.first_name).to eq("Alan")
        expect(@author.last_name).to eq("Turing")
        expect(@author.homepage).to eq("http://wikipedia.org/Alan_Turing")
    end

    it "#name should return the full name" do
        @author = Author.new(first_name: "Alan", last_name: "Turing")
        expect(@author.name).to eq("Alan Turing")
    end

    it "should not validate without last name" do
        @author = Author.new(first_name: "Alan", homepage: "http://wikipedia.org/Alan_Turing")
        expect(@author).to_not be_valid
    end

    it "should have and belong to many papers" do
        @author = Author.new(first_name: "Alan", last_name: "Turing", homepage: "http://wikipedia.org/Alan_Turing")
        expect(@author.papers).to be_empty
    end
end

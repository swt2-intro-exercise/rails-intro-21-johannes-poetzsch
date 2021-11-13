require 'rails_helper'

describe "Author Model", type: :model do
    it "should have first name, last name, and homepage" do
        author = Author.new(first_name: "Alan", last_name: "Turing", homepage: "http://wikipedia.org/Alan_Turing")
        expect(author.first_name).to eq("Alan")
        expect(author.last_name).to eq("Turing")
        expect(author.homepage).to eq("http://wikipedia.org/Alan_Turing")
    end

    it "#name should return the full name" do
        a = Author.new(first_name: "Alan", last_name: "Turing")
        expect(a.name).to eq("Alan Turing")
    end
end

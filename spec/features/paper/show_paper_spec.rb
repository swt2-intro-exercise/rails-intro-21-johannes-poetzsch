require 'rails_helper'

describe "Paper details page", type: :feature do
    it "should exist at 'paper_path(@paper)' and render without error" do
        @paper = FactoryBot.create :paper
        visit paper_path(@paper)
    end

    it "should display paper details" do
        @paper = FactoryBot.create :paper
        visit paper_path(@paper)
        expect(page).to have_text @paper.title
        expect(page).to have_text @paper.venue
        expect(page).to have_text @paper.year
    end

    it "should list the authors" do
        @paper = FactoryBot.create :paper
        visit paper_path(@paper)
        expect(@paper.authors).to_not be_empty
        @paper.authors.each do |author|
            expect(page).to have_text author.name
        end
    end
end

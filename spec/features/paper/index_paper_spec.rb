require 'rails_helper'

describe "Paper index page", type: :feature do
    it "should exist at 'papers_path' and render without error" do
        visit papers_path
    end

    it "should display all papers in a table" do
        @paper = FactoryBot.create :paper
        visit papers_path
        expect(page).to have_table
        table = find('table')
        expect(table.find_all('th')[0]).to have_text 'Title'
        expect(table.find_all('th')[1]).to have_text 'Venue'
        expect(table.find_all('th')[2]).to have_text 'Year'
        expect(table).to have_text(@paper.title)
        expect(table).to have_text(@paper.venue)
        expect(table).to have_text(@paper.year)
    end

    it "should have a link to create a new paper" do
        visit papers_path
        expect(page).to have_link 'New', href: new_paper_path
    end

    it "should allow filtering papers by year" do
        @paper1 = Paper.create(title: 'title1', venue: 'venue1', year: 1950)
        @paper2 = Paper.create(title: 'title2', venue: 'venue2', year: 1951)

        visit papers_path(year: @paper1.year)
        expect(page).to have_text @paper1.title
        expect(page).not_to have_text @paper2.title

        visit papers_path(year: @paper2.year)
        expect(page).to have_text @paper2.title
        expect(page).not_to have_text @paper1.title
    end
end
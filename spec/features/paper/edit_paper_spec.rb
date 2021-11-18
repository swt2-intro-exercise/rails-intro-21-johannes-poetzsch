require 'rails_helper'

describe "Edit paper page", type: :feature do
    it "should exist at 'edit_paper_path(@paper)' and render withour error" do
        @paper = FactoryBot.create :paper
        visit edit_paper_path(@paper)
    end

    it "should have text inputs for an paper's title, last venue, and year" do
        @paper = FactoryBot.create :paper
        visit edit_paper_path(@paper)
        expect(page).to have_field('paper[title]')
        expect(page).to have_field('paper[venue]')
        expect(page).to have_field('paper[year]')
    end

    it "should save changes" do
        @paper = FactoryBot.create :paper
        visit edit_paper_path(@paper)
        page.fill_in 'paper[title]', with: 'A Note on Two Problems in Connexion with Graphs'
        page.fill_in 'paper[venue]', with: 'NUMERISCHE MATHEMATIK'
        page.fill_in 'paper[year]', with: '1959'
        find('input[type="submit"]').click
        @paper.reload
        expect(@paper.title).to eq 'A Note on Two Problems in Connexion with Graphs'
        expect(@paper.venue).to eq 'NUMERISCHE MATHEMATIK'
        expect(@paper.year).to eq 1959
    end

    it "should allow to select paper authors from a multiple select box" do
        @paper = FactoryBot.create :paper
        author = @paper.authors.first
        visit edit_paper_path(@paper)
        expect(page).to have_css('select[multiple]')
        select = page.find('select[multiple]')
        select.unselect author.name
        find('input[type="submit"]').click
        @paper.reload
        expect(@paper.authors).to be_empty
        visit edit_paper_path(@paper)
        select.select author.name
        find('input[type="submit"]').click
        @paper.reload
        expect(@paper.authors).to_not be_empty
    end
end

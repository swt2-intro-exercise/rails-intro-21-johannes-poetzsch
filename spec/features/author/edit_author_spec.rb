require 'rails_helper'

describe "Edit author page", type: :feature do
    it "should exist at 'edit_author_path(@author)' and render withour error" do
        @author = FactoryBot.create :author
        visit edit_author_path(@author)
    end

    it "should have text inputs for an author's first name, last name, and homepage" do
        @alan = FactoryBot.create :author
        visit edit_author_path(@alan)
        expect(page).to have_field('author[first_name]')
        expect(page).to have_field('author[last_name]')
        expect(page).to have_field('author[homepage]')
    end

    it "should save changes" do
        @author = FactoryBot.create :author
        visit edit_author_path(@author)
        page.fill_in 'author[first_name]', with: 'Edsger Wybe'
        page.fill_in 'author[last_name]', with: 'Dijkstra'
        page.fill_in 'author[homepage]', with: 'http://wikipedia.org/wiki/Edsger_W._Dijkstra'
        find('input[type="submit"]').click
        @author.reload
        expect(@author.first_name).to eq 'Edsger Wybe'
        expect(@author.last_name).to eq 'Dijkstra'
        expect(@author.homepage).to eq 'http://wikipedia.org/wiki/Edsger_W._Dijkstra'
    end
end
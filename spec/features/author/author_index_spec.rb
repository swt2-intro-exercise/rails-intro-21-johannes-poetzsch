require 'rails_helper'

describe "Author index page", type: :feature do
    it "should display all authors in a table" do
        @alan = FactoryBot.create :author
        visit authors_path
        expect(page).to have_table
        table = find('table')
        expect(table.find_all('th')[0]).to have_text 'Name'
        expect(table.find_all('th')[1]).to have_text 'Homepage'
        expect(table).to have_text(@alan.first_name)
        expect(table).to have_text(@alan.homepage)
        expect(table).to have_link @alan.name, href: author_path(@alan)
    end

    it "should have a link to create a new author" do
        visit authors_path
        expect(page).to have_link 'New', href: new_author_path
    end
end
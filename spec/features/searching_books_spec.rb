require "rails_helper"

feature "Searching Books", type: :feature do
  let!(:books) { create_list(:book, 20) }
  before(:each) { visit("/") }

  context "when user provides search information" do
    context "and a book is found" do
      scenario "displays the book name and description" do
        fill_in(:search, with: books.first.title)
        click_on("Search")

        expect(page).to have_content(books.first.title)
        expect(page).to have_content(books.first.description)
      end
    end

    context "and a book is not found" do
      scenario "displays book not found" do
        fill_in(:search, with: "Random")
        click_on("Search")

        expect(page).to have_content("Book Not Found")
      end
    end
  end

  context "when user does not provide search information" do
    scenario "displays all book information" do
      fill_in(:search, with: "")
      click_on("Search")

      expect(page).to have_content(books.first.title)
      expect(page).to have_content(books.last.title)
    end
  end
end

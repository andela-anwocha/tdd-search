require "rails_helper"

describe "Searching Books", type: :feature do
  context "when books are available" do
    gi

    context "and a book is found" do
      it "displays the book name and description" do
        fill_in(:search, with: )
      end
    end

    context "and a book is not found" do
      it "displays book not found" do
        
      end
    end
  end

  context "when books are not available" do
    
  end
end
require 'rails_helper'

RSpec.describe Book, type: :model do
  describe ".search" do
    before do
      @book1 = create(:book, title: "Book1")
      @book2 = create(:book, title: "Book2")
    end

    context "when search_value is not empty" do
      it "returns the book model" do
        expect(Book.search("book1")).to match_array([@book1])
      end
    end

    context "when search_value is empty" do
      it "returns all book models" do
        expect(Book.search("")).to match_array([@book1, @book2])
      end
    end
  end
end

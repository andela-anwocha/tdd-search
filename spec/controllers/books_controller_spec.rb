require "rails_helper"

describe BooksController, type: :controller do

  describe "GET home" do
    it "renders the home template" do
      get :home

      expect(response).to render_template(:home)
    end
  end

  describe "POST search" do
    before do
      @book1 = create(:book, title: "Book1")
      @book2 = create(:book, title: "Book2")
    end

    context "when search params is not nil" do
      context "and matches are found" do
        it "assigns the matches as an array to @books" do
          post :search, { search: "book1" }

          expect(assigns(:books)).to match_array([@book1])
        end

        it "renders the results template" do
          post :search, { search: "book" }

          expect(response).to render_template(:result)
        end
      end

      context "and matches are not found" do
        it "assigns an empty array to @books" do
          post :search, { search: "Random" }

          expect(assigns(:books)).to match_array([])
        end

        it "renders the result template" do
          post :search, { search: "Random" }

          expect(response).to render_template(:result)
        end
      end
    end

    context "when search params is nil" do
      it "assigns all books as an array to @books" do
        post :search, { search: nil }

        expect(assigns(:books)).to match_array([@book1, @book2])
      end

      it "renders the results template" do
        post :search, { search: nil }

        expect(response).to render_template(:result)
      end
    end 
  end
end
require "rails_helper"

RSpec.describe Book do
  before do
    FactoryBot.create(:book, title: "Fuck shit", author: "Poop Master")
    FactoryBot.create(:book, title: "Vag shit", author: "Piss Master")
  end 

  describe "books api", type: :request do
    it "returns all books" do
      get "/api/v1/books"

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end

  describe "POST/ books", type: :request do
    it "creates a new book" do 
      expect{
        post "/api/v1/books", params: { book: { title: "new book", author: "new writer"} }
      }.to change { Book.count }.from(2).to(3)

      expect(response).to have_http_status(:created)
    end
  end

  describe "DELETE/ books", type: :request do
    let!(:book)  { FactoryBot.create(:book, title: "Fuck shit", author: "Poop Master") }

    it "deletes a book by ID" do 
      expect{
        delete "/api/v1/books/#{book.id}"
      }.to change { Book.count }.from(3).to(2)

        expect(response).to have_http_status(:no_content)
    end
  end
end
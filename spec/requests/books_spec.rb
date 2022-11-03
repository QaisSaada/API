require "rails_helper"

RSpec.describe Book do
  describe "books api", type: :request do
    it "returns all books" do
      FactoryBot.create(:book, title: "Fuck shit", author: "Poop Master")
      FactoryBot.create(:book, title: "Vag shit", author: "Piss Master")

      get "/api/v1/books"

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end
  end
end
require 'rails_helper'

RSpec.describe "UsersControlers", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/users_controler/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/users_controler/create"
      expect(response).to have_http_status(:success)
    end
  end

end

require 'rails_helper'

RSpec.describe "Attractions", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/attractions/index"
      expect(response).to have_http_status(:success)
    end
  end

end

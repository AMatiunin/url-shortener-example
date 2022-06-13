require 'rails_helper'

RSpec.describe "URL", type: :request do
  describe "POST /shorting" do
    it "returns http success" do

      post "/shorting", params: { full_url: "http://somefull" }
      json = JSON.parse(response.body).deep_symbolize_keys

      expect(response.status).to eq(200)
      expect(json[:short_url]).to eq('www.example.com/780f5')
    end

    it "returns message" do
      post "/shorting", params: { full_url: nil }
      json = JSON.parse(response.body).deep_symbolize_keys

      expect(response.status).to eq(200)
      expect(json[:message]).to eq("Need URL")
    end
  end

  describe "GET /find" do
    before do
      Shortener.shorts_url("http://www.someexampleurl.com", "www.example.com")
    end
    it "returns full_url http success" do

      get "/find", params: { short_url: "www.example.com/1b665"}
      json = JSON.parse(response.body).deep_symbolize_keys

      expect(response.status).to eq(200)
      expect(json[:full_url]).to eq('http://www.someexampleurl.com')
    end

    it "returns http fails" do
      get "/find", params: { short_url: nil }
      json = JSON.parse(response.body).deep_symbolize_keys

      expect(json[:message]).to eq("Need URL")
    end
  end
end

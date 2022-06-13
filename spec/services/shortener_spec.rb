require 'rails_helper'

RSpec.describe Shortener do
  let(:full_url) { "http://www.someexampleurl.com" }
  let(:full_url2) { "http://www.someexampleurl2.com" }
  let(:short_url) { "http://domain.com/1b665" }

  it "shortens a full URL, receive response with the shortened URL" do

    shortened = Shortener.shorts_url(full_url)

    expect(shortened).to eq(short_url)
  end

  it "gives each URL its own short_url" do
    code_1 = Shortener.shorts_url(full_url)

    code_2 = Shortener.shorts_url(full_url2)

    expect(code_2).not_to eq(code_1)
  end

  it "find full_url by short url" do
    Shortener.shorts_url(full_url)

    expect(Shortener.get_url(short_url).full_url).to eq(full_url)
    expect(Shortener.get_url(short_url).created_at).to be_within(1.second).of Time.now
  end
end
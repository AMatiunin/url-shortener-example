require 'digest/sha2'

class Shortener

  BASE_URL = "http://domain.com/"

  attr_reader :url

  def initialize(url)
    @url = url
  end

  def self.shorts_url(url)
    code = Digest::SHA256.hexdigest(url)[0..4]
    short_url = BASE_URL + code
    Url.create(full_url: url, short_url: short_url) unless Url.where(full_url: url).present?
    short_url
  end

  def self.get_url(short)
    url = Url.find_by(short_url: short)
    url
  end
end
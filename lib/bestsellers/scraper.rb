require "nokogiri"
require "open-uri"
require "pry"

class Scraper
  doc = Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/"))

  binding.pry
end

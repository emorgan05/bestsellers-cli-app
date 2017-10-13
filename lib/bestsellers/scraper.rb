require "nokogiri"
require "open-uri"
require "pry"

class Scraper
  doc = Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/"))

  books_array = []

  doc.css(".subcategory ol li").each do |book|
    hash = {
      :title => book.css(".title").text.strip,
      :author => book.css(".author").text.strip,
      :description => book.css(".description").text.strip,
      :weeks_on_list => book.css(".freshness").text.strip,
      # :amazon_url => book.css("ul li button").attribute("data-amazon").value.strip,
      # :category => doc.css(".subcategory h2 a").attribute("data-version").text.strip
    }
    books_array << hash
  end
  books_array

  binding.pry
  # sections = doc.css(".subcategory").text
  # first book title = doc.css(".subcategory").first.css("ol li:nth-child(1) .title").text.strip
  # first book author = doc.css(".subcategory").first.css("ol li:nth-child(1) .author").text.strip
  # first book description = doc.css(".subcategory").first.css("ol li:nth-child(1) .description").text.strip
  # first book weeks on list = doc.css(".subcategory").first.css("ol li:nth-child(1) .freshness").text.strip
  # first book amazon url = doc.css(".subcategory").first.css("ol li:nth-child(1) ul li button").attribute("data-amazon").value.strip

  # #main > div.view.landing-view > section:nth-child(1) > ol > li:nth-child(1) > article > div > h3
  # #main > div.view.landing-view > section:nth-child(1) > ol > li:nth-child(1) > ul > li > button
end

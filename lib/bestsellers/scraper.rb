require "nokogiri"
require "open-uri"
require "pry"

class Scraper
  doc = Nokogiri::HTML(open("https://www.nytimes.com/books/best-sellers/"))

  books_array = []

  book_counter = 1
  category = doc.css("section")

  category.each do |books|
    books.each do |book|
      hash = {
        :title => category.css("ol li").css(".title").text.strip
      }
    end
  end

  # category = doc.css(".subcategory")
  # category.each do |books|
  #   books.each do |book|
  #     hash = {
  #       :title => doc.css(".subcategory").first.css("ol li:nth-child(1) .title").text.strip
  #     }
  #   end
  # end
  binding.pry
  # sections = doc.css(".subcategory").text
  # first book title = doc.css(".subcategory").first.css("ol li:nth-child(1) .title").text.strip
  # first book author = doc.css(".subcategory").first.css("ol li:nth-child(1) .author").text.strip
  # first book description = doc.css(".subcategory").first.css("ol li:nth-child(1) .description").text.strip
  # first book weeks on list = doc.css(".subcategory").first.css("ol li:nth-child(1) .freshness").text.strip
  # first book amazon url = doc.css(".subcategory").first.css("ol li:nth-child(1) ul li button").attribute("data-amazon").value.strip

  # #main > div.view.landing-view > section:nth-child(1) > ol > li:nth-child(1) > article > div > h3
end

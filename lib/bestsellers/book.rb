class Book

  attr_accessor :title, :author, :description, :weeks_on_list, :amazon_url, :category

  @@all = []

  def initialize
    if self.title != ""
      @@all << self
    end
  end

  def new_from_collection(Scraper.new.book_scraper("https://www.nytimes.com/books/best-sellers/"))
    books_array.each do |book|
      Book.new(book)
    end
  end

  def self.all
    @@all
  end

end

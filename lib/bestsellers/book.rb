class Book

  attr_accessor :title, :author, :description, :weeks_on_list, :amazon_url, :category

  @@all = []

  def initialize(book_hash)
    book_hash.each do |key, value|
      self.send(("#{key}="), value)
    end
    if self.title != ""
      @@all << self
    end
  end

  def new_from_collection(Scraper.new)
    books_array.each do |book|
      Book.new(book)
    end
  end

  def self.all
    @@all
  end

end

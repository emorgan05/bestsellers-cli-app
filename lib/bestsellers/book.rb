class Bestsellers::Book

  attr_accessor :category, :title, :author, :description, :weeks_on_list, :amazon_url

  @@all = []

  def initialize(category, title, author, description, weeks_on_list, amazon_url)
    @category = category
    @title = title
    @author = author
    @description = description
    @weeks_on_list = weeks_on_list
    @amazon_url = amazon_url
  end

  def save
    if !@@all.include?(self)
      @@all << self
    end
  end

  def self.new_from_json(category, book)
    book = self.new(category, book["title"], book["author"], book["description"], book["weeks_on_list"], book["amazon_product_url"])
    book.save
  end

  def self.all
    @@all
  end

  def self.find_by_category(category)
    @@all.select do |a|
      a.category.name == category.name
    end
  end

end

class Bestsellers::Book

  attr_accessor :title, :author, :description, :weeks_on_list, :amazon_url, :category

  @@all = []

  def initialize(title, author, description, weeks_on_list, amazon_url, category = nil)
    @title = title
    @author = author
    @description = description
    @weeks_on_list = weeks_on_list
    @amazon_url = amazon_url
    @category = category
  end

  def save
    if !@@all.include?(self)
      @@all << self
    end
  end

  def self.new_from_json(book)
    self.new(book["title"], book["author"], book["description"], book["weeks_on_list"], book["amazon_product_url"]).save
  end

  def self.all
    @@all
  end

end

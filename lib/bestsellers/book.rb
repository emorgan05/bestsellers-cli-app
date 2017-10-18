class Bestsellers::Book

  attr_accessor :title, :author, :description, :weeks_on_list, :amazon_url, :category

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

  def self.new_from_json(list, book)
    self.new(list["list_name"], book["title"], book["author"], book["description"], book["weeks_on_list"], book["amazon_product_url"]).save
  end

  def self.all
    @@all
  end

  def self.find_by_category(category)
    @@all.select do |a|
      a.category == category
    end
  end

end

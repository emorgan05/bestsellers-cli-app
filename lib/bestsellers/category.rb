class Bestsellers::Category
  attr_accessor :name, :books

  @@all = []

  def initialize(name)
    @name = name
    @books = []
  end

  def save
    if !@@all.include?(self)
      @@all << self
    end
  end

  def self.new_from_json(list)
    category = self.new(list["list_name"])
    category.save
    list["books"].each do |book|
      book = Bestsellers::Book.new_from_json(category, book)
      category.books << book
    end
  end

  def self.all
    @@all
  end

end

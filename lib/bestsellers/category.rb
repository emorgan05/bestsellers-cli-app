class Bestsellers::Category
  attr_accessor :name, :books

  @@all = []

  def initialize(name)
    @name = name
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
      Bestsellers::Book.new_from_json(list, book)
    end
  end

  def self.all
    @@all
  end

end

# Bestsellers::Book.new(self, "Origin", "Dan Brown", "Second verse same as the first", "1", "www.amazon.com")

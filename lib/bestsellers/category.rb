class Bestsellers::Category
  attr_accessor :name

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
    self.new(list["list_name"]).save
    binding.pry
  end

  def self.all
    @@all
  end

end

# Bestsellers::Book.new(self, "Origin", "Dan Brown", "Second verse same as the first", "1", "www.amazon.com")

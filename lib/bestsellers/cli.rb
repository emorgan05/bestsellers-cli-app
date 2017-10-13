class Bestsellers::CLI

  def call
    puts "Welcome to the New York Times Bestseller List!"
    puts "Are you ready to find your next good read?"
    puts ""
    list_section
  end

  def list_section
    puts "1. Print and Ebook Fiction"
    puts "2. Hardcover Fiction"
    puts "3. Print and Ebook Nonfiction"
    puts "Choose a number to see the top five books in that section:"
    section_input = gets.strip.to_i
  end

  def list_books
    puts "1. Origin by Dan Brown"
    puts "2. The Sun and Her Flowers by Rupi Kaur"
    puts "3. Sleeping Beauties by Steven King and Owen King"
    puts "Choose a number for full details about the book, or type 'category list' to return to the list of categories, or 'exit'"
    books_input = gets.strip
  end

end

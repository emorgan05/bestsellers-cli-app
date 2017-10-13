class Bestsellers::CLI

  def call
    puts "Welcome to the New York Times Bestseller List!"
    puts "Are you ready to find your next good read?"
    puts ""
    list_categories
    list_books
    book_details
  end

  def list_categories
    puts "1. Print and Ebook Fiction"
    puts "2. Hardcover Fiction"
    puts "3. Print and Ebook Nonfiction"
    puts "Choose a number to see the top five books in that category:"
    @category_input = gets.strip
  end

  def list_books
    if @category_input == "1"
      puts "Category: Print and Ebook Fiction"
      puts "1. Origin by Dan Brown"
      puts "2. The Sun and Her Flowers by Rupi Kaur"
      puts "3. Sleeping Beauties by Steven King and Owen King"
      puts "Choose a number for full details about the book, type 'category list' to return to the list of categories, or 'exit'"
      @books_input = gets.strip
    end
    case @books_input
    when is_a?(Integer)
      book_details
    when 'category list'
      list_categories
    when 'exit'
      exit
    end
  end

  def book_details
    if @books_input == "1"
      puts "Origin"
      puts "Dan Brown"
      puts "After reconnecting with one of his first students, who is now a billionaire futurist, symbology professor Robert Langdon must go on a perilous quest with a beautiful museum director."
      puts "New this week"
      puts "https://www.amazon.com/Origin-Novel-Dan-Brown-ebook/dp/B01LY7FD0D?tag=NYTBS-20"
    end
    puts "Type 'book list' to return to the list of books in this section, type 'category list' to return to the list of categories, or 'exit'"
    @book_details_input = gets.strip
    case @book_details_input
    when 'book list'
      list_books
    when 'category list'
      list_categories
    when 'exit'
      exit
    end
  end

end

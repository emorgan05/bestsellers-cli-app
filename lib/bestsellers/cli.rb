class Bestsellers::CLI

  def call
    Bestsellers::API.bestsellers_list
    puts "Welcome to the New York Times Bestseller List!"
    puts "Are you ready to find your next good read?"
    puts ""
    list_categories
    list_books
    book_details
  end

  def list_categories
    Bestsellers::Category.all.each.with_index(1) do |category, index|
      puts "#{index}. #{category.name}"
    end
    puts "Choose a number to see the top five books in that category:"
    @category_input = gets.strip
  end

  def list_books
    # Book.all.each_with_index do |book, i|
    #   puts "#{i}. #{book.title} #{book.author}"
    # end

    puts "Choose a number for full details about the book, type 'category list' to return to the list of categories, or 'exit'"
    @books_input = gets.strip

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

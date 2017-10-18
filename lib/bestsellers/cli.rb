class Bestsellers::CLI

  def call
    Bestsellers::API.bestsellers_list
    puts "Welcome to the New York Times Bestseller List!"
    puts "Are you ready to find your next good read?"
    puts ""

    list_categories
    puts ""
    puts "Choose a number to see the top five books in that category:"
    @category_input = gets.strip
    
    list_books
    book_details
  end

  def list_categories
    Bestsellers::Category.all.each.with_index(1) do |category, index|
      puts "#{index}. #{category.name}"
    end
  end

  def list_books
    category = Bestsellers::Category.all[@category_input.to_i - 1].name

    @book_array = Bestsellers::Book.find_by_category(category)

    @book_array.each.with_index(1) do |book, index|
      puts "#{index}. #{book.title} by #{book.author}"
    end

    puts ""
    puts "Choose a number for full details about the book, type 'category list' to return to the list of categories, or 'exit'"
    @books_input = gets.strip

    case @books_input
    when is_a?(Integer) # problem here
      book_details
    when 'category list'
      list_categories
    when 'exit'
      exit
    end
  end

  def book_details
    book = @book_array[@books_input.to_i - 1]
    puts "#{book.title} by #{book.author}"
    puts "Summary: #{book.description}"
    puts "Weeks on the Bestsellers List: #{book.weeks_on_list}"
    puts "Find on Amazon: #{book.amazon_url}"
    puts ""

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

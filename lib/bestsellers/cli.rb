class Bestsellers::CLI

  def call
    Bestsellers::API.bestsellers_list
    puts "Welcome to the New York Times Bestseller List!"
    puts "Are you ready to find your next good read?"
    puts ""
    category_menu
    goodbye
  end

  # Menus for each portion of user category_choice

  def category_menu
    list_categories
    category_choice
    if @category_input == "exit"
      goodbye
    elsif @category_input.to_i != 0 && @category_input.to_i <= Bestsellers::Category.all.size
      book_list_menu
    else
      puts "Does not compute..."
      category_menu
    end
  end

  def book_list_menu
    list_books
    books_choice
    if @books_input == "exit"
      goodbye
    elsif @books_input == "category list"
      category_menu
    elsif @books_input.to_i != 0 && @books_input.to_i <= @book_array.size
      book_details_menu
    else
      puts "Does not compute..."
      book_list_menu
    end
  end

  def book_details_menu
    book_details
    details_choice
    if @details_input == "exit"
      goodbye
    elsif @details_input == "category list"
      category_menu
    elsif @details_input == "book list"
      book_list_menu
    else
      puts "Does not compute..."
      book_details_menu
    end
  end

  # Methods for the category

  def list_categories
    Bestsellers::Category.all.each.with_index(1) do |category, index|
      puts "#{index}. #{category.name}"
    end
  end

  def category_choice
    puts ""
    puts "Choose a number to see the top five books in that category or type 'exit'"
    @category_input = gets.strip.downcase
  end

  # Methods for listing the top 5 books_choice

  def list_books
    category = Bestsellers::Category.all[@category_input.to_i - 1]

    @book_array = Bestsellers::Book.find_by_category(category)

    @book_array.each.with_index(1) do |book, index|
      puts "#{index}. #{book.title} by #{book.author}"
    end
  end

  def books_choice
    puts ""
    puts "Choose a number for full details about the book, type 'category list' to return to the list of categories, or 'exit'"
    @books_input = gets.strip.downcase
  end

  # Methods for listing details about one book

  def book_details
    book = @book_array[@books_input.to_i - 1]
    puts "#{book.title} by #{book.author}".colorize(:green)
    puts "Summary:".colorize(:blue) + " #{book.description}"
    puts "Weeks on the Bestsellers List:".colorize(:blue) + " #{book.weeks_on_list}"
    puts "Find on Amazon:".colorize(:blue) + " #{book.amazon_url}"
    puts ""
  end

  def details_choice
    puts ""
    puts "Type 'book list' to return to the list of books in this section, type 'category list' to return to the list of categories, or 'exit'"
    @details_input = gets.strip.downcase
  end

  def goodbye
    puts "Come back soon for your next good read!"
    exit
  end
end

class Bestsellers::CLI

  def call
    Bestsellers::API.bestsellers_list
    puts "Welcome to the New York Times Bestseller List!"
    puts "Are you ready to find your next good read?"
    puts ""
    menu
  end

  def menu
    input = nil
    list_categories
    category_choice
    if @category_input == "exit"
      goodbye
    else
      @category_input = @category_input.to_i
      list_books
      books_choice
      if @books_input == "exit"
        goodbye
      elsif @books_input == "category list"
        menu
      else
        @books_input = @books_input.to_i
        book_details
        details_choice
        if @details_input == "exit"
          goodbye
        elsif @details_input == "category list"
          menu
        elsif @details_input == "book_list"
          menu
        end
      end
    end
  end

  def list_categories
    Bestsellers::Category.all.each.with_index(1) do |category, index|
      puts "#{index}. #{category.name}"
    end
  end

  def category_choice
    puts "Choose a number to see the top five books in that category or type 'exit'"
    @category_input = gets.strip
  end

  def list_books
    category = Bestsellers::Category.all[@category_input - 1].name

    @book_array = Bestsellers::Book.find_by_category(category)

    @book_array.each.with_index(1) do |book, index|
      puts "#{index}. #{book.title} by #{book.author}"
    end
  end

  def books_choice
    puts "Choose a number for full details about the book, type 'category list' to return to the list of categories, or 'exit'"
    @books_input = gets.strip
  end

  def book_details
    book = @book_array[@books_input - 1]
    puts "#{book.title} by #{book.author}"
    puts "Summary: #{book.description}"
    puts "Weeks on the Bestsellers List: #{book.weeks_on_list}"
    puts "Find on Amazon: #{book.amazon_url}"
    puts ""
  end

  def details_choice
    puts "Type 'book list' to return to the list of books in this section, type 'category list' to return to the list of categories, or 'exit'"
    @details_input = gets.strip
  end

  def goodbye
    "Come back soon for your next good read!"
  end
end

# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
CLI allows the user to see a list of categories from the New York Times Bestseller List.
It offers them the choice to see the top 5 books in that category this week, and if they choose a category, it shows them the top 5 books.
It offers them the choice to see details for one book, and if chosen, shows them the details.
It offers to let them see the categories or book list again.

- [x] Pull data from an external source
I used the New York Times Books API.
This API has several different options, and I chose the overview. It gives all the categories, but sticks to just the top 5 books from each category.
I chose this because it was the list that offered me the option of seeing a number of categories.
After signing up for the API key, I used RestClient to access the API, and JSON.parse to parse the data.
After I've got the information in JSON format, I instantiated Categories and Books.

- [x] Implement both list and detail views
I have two list views:
1. The list of categories. This week it shows 14.
2. The list of books. For each category, it shows 5 books.

The detail views give title, author, summary, weeks on the list, and amazon url for each book. 

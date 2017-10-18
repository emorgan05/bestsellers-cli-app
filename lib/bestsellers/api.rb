class Bestsellers::API
  attr_accessor :list_data, :lists

  def self.bestsellers_list
    lists = RestClient.get("https://api.nytimes.com/svc/books/v3/lists/overview.json", params: { "api-key" => "c95058c8a60a42c5b9c063e4901717a2" })
    @list_data = JSON.parse(lists)
    @list_data["results"]["lists"].each do |list|
      Bestsellers::Category.new_from_json(list)
      list["books"].each do |book|
        Bestsellers::Books.new_from_json(book)
      end
    end
  end

end

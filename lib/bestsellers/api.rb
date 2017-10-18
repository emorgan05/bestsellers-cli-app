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

  # lists/overview -- gives the top 5 for each category
  # uri = URI("https://api.nytimes.com/svc/books/v3/lists/overview.json")
  # http = Net::HTTP.new(uri.host, uri.port)
  # http.use_ssl = true
  # uri.query = URI.encode_www_form({
  #   "api-key" => "c95058c8a60a42c5b9c063e4901717a2"
  # })
  # request = Net::HTTP::Get.new(uri.request_uri)
  # @result = JSON.parse(http.request(request).body)
  # puts @result.inspect
end

class Bestsellers::API

  # lists/overview -- gives the top 5 for each category
  uri = URI("https://api.nytimes.com/svc/books/v3/lists/overview.json")
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  uri.query = URI.encode_www_form({
    "api-key" => "c95058c8a60a42c5b9c063e4901717a2"
  })
  request = Net::HTTP::Get.new(uri.request_uri)
  @result = JSON.parse(http.request(request).body)
  puts @result.inspect


end

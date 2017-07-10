
class Bestseller
  def self.get_bestseller_list
    response = RestClient::Request.execute(method: :get, url: 'https://api.nytimes.com/svc/books/v3/lists/best-sellers/history.json?api-key=5409cbab08d04e6ebec00ba0a84abeb7')
  end
end

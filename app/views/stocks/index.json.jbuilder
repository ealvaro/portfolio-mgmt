json.array!(@stocks) do |stock|
  json.extract! stock, :id, :symbol, :name, :price
  json.url stock_url(stock, format: :json)
end

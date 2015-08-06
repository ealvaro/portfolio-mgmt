json.array!(@holdings) do |holding|
  json.extract! holding, :id, :portfolio_id, :stock_id, :quantity
  json.url holding_url(holding, format: :json)
end

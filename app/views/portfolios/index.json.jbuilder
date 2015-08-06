json.array!(@portfolios) do |portfolio|
  json.extract! portfolio, :id, :name, :ssn
  json.url portfolio_url(portfolio, format: :json)
end

json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :dob, :email, :address, :city, :state
  json.url user_url(user, format: :json)
end

json.array!(@residences) do |residence|
  json.extract! residence, :id, :name, :address, :price, :price, :square_meters, :description, :rooms, :user_id
  json.url residence_url(residence, format: :json)
end

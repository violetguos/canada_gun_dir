json.extract! user, :id, :reddit_username, :club, :greater_region, :specific_city, :province, :notes, :created_at, :updated_at
json.url user_url(user, format: :json)

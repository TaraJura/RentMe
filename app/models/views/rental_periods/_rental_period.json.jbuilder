json.extract! rental_period, :id, :from, :to, :returned_at, :created_at, :updated_at
json.url rental_period_url(rental_period, format: :json)

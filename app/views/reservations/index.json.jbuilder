json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :reservation_date, :name, :wed, :thur, :fri, :sat, :sun, :mon, :tue, :dinner, :comment
  json.url reservation_url(reservation, format: :json)
end

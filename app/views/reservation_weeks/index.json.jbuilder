json.array!(@reservation_weeks) do |reservation_week|
  json.extract! reservation_week, :id, :res_date, :note
  json.url reservation_week_url(reservation_week, format: :json)
end

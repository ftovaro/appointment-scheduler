json.extract! appointment, :id, :title, :description, :start_date, :end_date, :summary, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)

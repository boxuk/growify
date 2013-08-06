json.array!(@todos) do |todo|
  json.extract! todo, :plant_id, :message
  json.url todo_url(todo, format: :json)
end

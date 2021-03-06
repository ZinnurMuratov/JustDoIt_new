json.array!(@tasks) do |task|
  json.extract! task, :user_id, :id, :title, :description
  json.url task_url(task, format: :json)
end
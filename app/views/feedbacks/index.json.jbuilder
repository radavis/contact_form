json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :email, :subject, :description, :first_name, :last_name
  json.url feedback_url(feedback, format: :json)
end

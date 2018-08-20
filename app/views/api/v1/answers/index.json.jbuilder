json.array! @answers do |answer|
  json.extract! answer, :id, :content
  json.date answer.created_at.strftime("%m/%d/%y")
  json.user do
    json.extract! answer.user, :nickname, :avatar_url, :gender
  end
end

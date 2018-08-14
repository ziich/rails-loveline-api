json.array! @comments do |comment|
  json.extract! comment, :id, :content, :created_at
  json.user do
    json.extract! comment.user, :nickname, :avatar_url
  end
end


json.users do
    json.array! @users do |user|
    json.extract! user, :id, :nickname, :avatar_url, :gender
      end
end

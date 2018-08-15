json.extract! @user, :id, :nickname, :avatar_url, :gender
json.user_loveline @user.loveline, :id
json.posts do
json.array! @user.posts do |post|
    json.extract! post, :id, :title, :content, :image_url

      end

  end
json.date @user.created_at.strftime("%m/%d/%y")
    json.user_loveline @user.loveline, :id

json.lovelines_users do
 json.array! @loveline.users do |user|
    json.extract! user, :id, :nickname,:gender, :avatar_url
 end
end


json.date @loveline.created_at.strftime("%m/%d/%y")
json.lovelines_posts do
  json.array! @loveline.posts do |post|
    json.extract! post, :id, :title,:content, :image_url
    json.Date post.created_at.strftime("%m/%d/%y")
    json.post_user post.user, :id, :nickname, :avatar_url, :gender
    json.post_loveline post.loveline, :id
    json.comments post.comments do |comment|
      json.extract! comment, :id, :content
      json.date comment.created_at.strftime("%m/%d/%y")
      json.comment_user comment.user, :id, :nickname, :avatar_url, :gender
    end
    json.like post.num_likes
  end
end

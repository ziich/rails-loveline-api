json.posts do
  json.array! @posts do |post|
    json.extract! post, :id, :title,:content, :image_url
    json.date post.created_at.strftime("%m/%d/%y")
    json.post_user post.user, :id, :nickname, :avatar_url, :gender
    json.post_loveline post.loveline, :id,:user_one_id, :user_two_id
    json.comments post.comments do |comment|
      json.extract! comment, :id, :content
      json.date comment.created_at.strftime("%m/%d/%y")
      json.comment_user comment.user, :id, :nickname, :avatar_url, :gender
    end
    json.like post.num_likes
  end
end

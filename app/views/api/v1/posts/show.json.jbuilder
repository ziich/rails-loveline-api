json.extract! @post, :id, :content, :title, :image_url
json.date @post.created_at.strftime("%m/%d/%y")
    json.post_user @post.user, :id, :nickname, :avatar_url
    json.comments @post.comments do |comment|
      json.extract! comment, :id, :content
      json.date comment.created_at.strftime("%m/%d/%y")
      json.comment_user comment.user, :id, :nickname, :avatar_url
    end
    json.like @post.num_likes

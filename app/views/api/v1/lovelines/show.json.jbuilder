json.loveline_id @loveline, :id
json.loveline_score @loveline, :score
json.date @loveline.created_at.strftime("%m/%d/%y")
json.lovelines_users do
 json.array! @loveline.users do |user|
    json.extract! user, :id, :nickname,:gender, :avatar_url
 end
end




json.prompts do

  json.array! @loveline.prompt_lovelines do |prompt_loveline|
    json.prompt_id prompt_loveline, :id
    json.prompt_score prompt_loveline.prompt, :score
    json.Prompt_created_Date prompt_loveline.created_at.strftime("%m/%d/%y")
    json.question prompt_loveline.prompt.content
    json.answers prompt_loveline.answers do |answer|
      json.date answer.created_at.strftime("%m/%d/%y")
      json.extract! answer, :id, :content
      json.answer_user answer.user, :id, :nickname, :avatar_url, :gender
    end
  end
end




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

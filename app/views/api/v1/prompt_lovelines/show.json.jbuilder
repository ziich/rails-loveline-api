json.extract! @prompt_loveline, :id, :loveline_id, :prompt_id
json.question @prompt_loveline.prompt, :content
json.date @prompt_loveline.created_at.strftime("%m/%d/%y")
    json.answers @prompt_loveline.answers do |answer|
      json.extract! answer, :id, :content
      json.date answer.created_at.strftime("%m/%d/%y")
      json.answer_user answer.user, :id, :nickname, :avatar_url, :gender
    end

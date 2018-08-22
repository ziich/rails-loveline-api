json.prompt_lovelines do
  json.array! @prompt_lovelines do |prompt_loveline|
    json.extract! prompt_loveline, :id,:prompt_id, :loveline_id
    json.question prompt_loveline.prompt, :content, :score
    json.answers prompt_loveline.answers do |answer|
      json.newYorkSoCool answer, :content
    end
  end
end

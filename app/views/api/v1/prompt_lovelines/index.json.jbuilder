json.prompt_lovelines do
  json.array! @prompt_lovelines do |prompt_lovelines|
    json.extract! prompt_lovelines, :id,:prompt_id, :loveline_id
  end
end

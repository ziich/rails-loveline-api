json.prompts do
  json.array! @prompts do |prompt|
    json.extract! prompt, :id,:content, :score
  end
end

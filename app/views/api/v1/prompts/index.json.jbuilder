json.prompts do
  json.array! @prompts do |prompt|
    json.extract! prompt, :content
  end
end

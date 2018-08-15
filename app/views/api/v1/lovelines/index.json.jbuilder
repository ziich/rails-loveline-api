json.lovelines do
    json.array! @lovelines do |loveline|
      json.extract! loveline, :id
    end
end

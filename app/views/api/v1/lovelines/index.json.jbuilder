json.lovelines do
    json.array! @lovelines do |loveline|
      json.extract! loveline, :id
      json.date loveline.created_at.strftime("%m/%d/%y")
    end
end

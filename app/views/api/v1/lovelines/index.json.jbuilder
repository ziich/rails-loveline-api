json.lovelines do

    json.array! @lovelines do |loveline|
      json.extract! loveline, :id, :user_one_id, :user_two_id
    end

end

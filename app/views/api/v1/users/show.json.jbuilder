json.extract! @user, :id, :name, :avatar
json.user_loveline @user.loveline, :id, :user_one_id, :user_two_id
json.date @user.created_at.strftime("%m/%d/%y")

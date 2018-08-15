# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Loveline.create()
Loveline.create()

User.create(nickname: "yunshengji", gender: 1, avatar_url: "http//gee", loveline_id: 1)
User.create(nickname: "Chris", gender: 1, avatar_url: "http//chris", loveline_id: 1)
User.create(nickname: "Fabio", gender: 1, avatar_url: "http//Fabio", loveline_id: 2)
User.create(nickname: "Callum", gender: 2, avatar_url: "http//Callum", loveline_id:2)



a = Post.create(title: "good" ,content: "Today is a good day", user_id: 1, loveline_id: 1)
b = Post.create(title: "somehow good",content: "Tomorrow will be a good day", user_id: 2, loveline_id: 1)
c = Post.create(title: "very good",content: "The day after tmr will be a good day",user_id: 1, loveline_id: 1)

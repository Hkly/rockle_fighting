# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


["https://s3-us-west-2.amazonaws.com/gabe-random/rockle_1.png",
"https://s3-us-west-2.amazonaws.com/gabe-random/rockle_2.png",
"https://s3-us-west-2.amazonaws.com/gabe-random/rockle_3.png"].each_with_index do |image,index|
  user = User.new(username: "Username #{index+1}", password:'password')
  if user.save
    puts "User #{user.id} created"
  end
  rockle = Rockle.new(user: user, name: "Rockle #{index+1}", image_url: image, species: (["a", "b", "c", "d", "e"].sample))
  if rockle.save
    puts "Rockle #{rockle.id} created"
  end
end

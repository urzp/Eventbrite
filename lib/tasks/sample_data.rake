namespace	:db	do
		desc	"Fill	database	with	sample	data"
		task	populate:	:environment	do
				User.create!(name:	"Paul",
																	email:	"urzp@email.org")

				99.times	do	|n|
						name		=	Faker::Name.name
						email	=	"user_#{n+1}@railstutorial.org"
						User.create!(name:	name, email:	email)
				end

				99.times	do	|n|
						user = User.find(n + 1)
						name = " #{user.name} Party"
						date = Date.today + rand(30) - 15
						location = "home  #{user.name}"
						Event.create!(owner_id: user.id, name: name, date: date, location: location )
				end
		end
end

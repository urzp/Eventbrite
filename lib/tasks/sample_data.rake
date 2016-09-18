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
		end
end
